// Copyright 2011 Google Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"bytes"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"sort"
	"strings"
	"unicode"
)

// goGenVersion is the version of the Go code generator
const goGenVersion = "0.5"
const swiftIndent = "    "
var serviceFilter = [...]string{ "[pP]laylist.*", "[tT]humbnail.*", "[rR]esourceId.*", "[pP]ageInfo.*", "[tT]okenPagination.*"}


var (
	apiToGenerate = flag.String("api", "*", "The API ID to generate, like 'tasks:v1'. A value of '*' means all.")
	useCache      = flag.Bool("cache", true, "Use cache of discovered Google API discovery documents.")
	genDir        = flag.String("gendir", "", "Directory to use to write out generated Go files")
	build         = flag.Bool("build", false, "Compile generated packages.")
	install       = flag.Bool("install", false, "Install generated packages.")
	apisURL       = flag.String("discoveryurl", "https://www.googleapis.com/discovery/v1/apis", "URL to root discovery document")

	publicOnly = flag.Bool("publiconly", true, "Only build public, released APIs. Only applicable for Google employees.")

	jsonFile     = flag.String("api_json_file", "", "If non-empty, the path to a local file on disk containing the API to generate. Exclusive with setting --api.")
	output       = flag.String("output", "", "(optional) Path to source output file. If not specified, the API name and version are used to construct an output path (e.g. tasks/v1).")
	googleAPIPkg = flag.String("googleapi_pkg", "google.golang.org/api/googleapi", "Go package path of the 'googleapi' support package.")
	contextPkg   = flag.String("context_pkg", "golang.org/x/net/context", "Go package path of the 'context' support package.")
)

// API represents an API to generate, as well as its state while it's
// generating.
type API struct {
	ID            string `json:"id"`
	Name          string `json:"name"`
	Version       string `json:"version"`
	Title         string `json:"title"`
	DiscoveryLink string `json:"discoveryLink"` // relative
	RootURL       string `json:"rootUrl"`
	ServicePath   string `json:"servicePath"`
	Preferred     bool   `json:"preferred"`

	m map[string]interface{}

	forceJSON []byte // if non-nil, the JSON schema file. else fetched.
	usedNames namePool
	schemas   map[string]*Schema // apiName -> schema

	p  func(format string, args ...interface{}) // print raw
	pn func(format string, args ...interface{}) // print with indent and newline
}

func (a *API) sortedSchemaNames() (names []string) {
	for name := range a.schemas {
		names = append(names, name)
	}
	sort.Strings(names)
	return
}

type AllAPIs struct {
	Items []*API `json:"items"`
}

type generateError struct {
	api   *API
	error error
}

func (e *generateError) Error() string {
	return fmt.Sprintf("API %s failed to generate code: %v", e.api.ID, e.error)
}

type compileError struct {
	api    *API
	output string
}

func (e *compileError) Error() string {
	return fmt.Sprintf("API %s failed to compile:\n%v", e.api.ID, e.output)
}

func main() {
	flag.Parse()
	fmt.Printf("output %s\n", *output)
	if *install {
		*build = true
	}

	var (
		apiIds  = []string{}
		matches = []*API{}
		errors  = []error{}
	)
	for _, api := range getAPIs() {
		apiIds = append(apiIds, api.ID)
		if !api.want() {
			continue
		}
		matches = append(matches, api)
		log.Printf("Generating API %s", api.ID)
		err := api.WriteGeneratedCode()
		if err != nil {
			errors = append(errors, &generateError{api, err})
			continue
		}
		if *build {
			var args []string
			if *install {
				log.Printf("install API %s", api.ID)
				args = append(args, "install")
			} else {
				log.Printf("build API %s", api.ID)
				args = append(args, "build")
			}
			args = append(args, api.Target())
			out, err := exec.Command("go", args...).CombinedOutput()
			if err != nil {
				errors = append(errors, &compileError{api, string(out)})
			}
		}
	}

	if len(matches) == 0 {
		log.Fatalf("No APIs matched %q; options are %v", *apiToGenerate, apiIds)
	}

	if len(errors) > 0 {
		log.Printf("%d API(s) failed to generate or compile:", len(errors))
		for _, ce := range errors {
			log.Printf(ce.Error())
		}
		os.Exit(1)
	}
}

func (a *API) want() bool {
	if strings.Contains(a.ID, "buzz") {
		// R.I.P.
		return false
	}
	if strings.Contains(a.ID, "fusiontables") {
		// TODO(bradfitz): broken codegen.
		return false
	}
	return *apiToGenerate == "*" || *apiToGenerate == a.ID
}

func getAPIs() []*API {
	if *jsonFile != "" {
		return getAPIsFromFile()
	}
	var all AllAPIs
	disco := slurpURL(*apisURL)
	if err := json.Unmarshal(disco, &all); err != nil {
		log.Fatalf("error decoding JSON in %s: %v", apisURL, err)
	}
	if !*publicOnly && *apiToGenerate != "*" {
		parts := strings.SplitN(*apiToGenerate, ":", 2)
		apiName := parts[0]
		apiVersion := parts[1]
		all.Items = append(all.Items, &API{
			ID:            *apiToGenerate,
			Name:          apiName,
			Version:       apiVersion,
			DiscoveryLink: fmt.Sprintf("./apis/%s/%s/rest", apiName, apiVersion),
		})
	}
	return all.Items
}

// getAPIsFromFile handles the case of generating exactly one API
// from the flag given in --api_json_file
func getAPIsFromFile() []*API {
	if *apiToGenerate != "*" {
		log.Fatalf("Can't set --api with --api_json_file.")
	}
	if !*publicOnly {
		log.Fatalf("Can't set --publiconly with --api_json_file.")
	}
	a, err := apiFromFile(*jsonFile)
	if err != nil {
		log.Fatal(err)
	}
	return []*API{a}
}

func apiFromFile(file string) (*API, error) {
	jsonBytes, err := ioutil.ReadFile(file)
	if err != nil {
		return nil, fmt.Errorf("Error reading %s: %v", file, err)
	}
	a := &API{
		forceJSON: jsonBytes,
	}
	if err := json.Unmarshal(jsonBytes, a); err != nil {
		return nil, fmt.Errorf("Decoding JSON in %s: %v", file, err)
	}
	return a, nil
}

func writeFile(file string, contents []byte) error {
	// Don't write it if the contents are identical.
	existing, err := ioutil.ReadFile(file)
	if err == nil && (bytes.Equal(existing, contents) || basicallyEqual(existing, contents)) {
		return nil
	}
	return ioutil.WriteFile(file, contents, 0644)
}

var etagLine = regexp.MustCompile(`(?m)^\s+"etag": ".+\n`)

// basicallyEqual reports whether a and b are equal except for boring
// differences like ETag updates.
func basicallyEqual(a, b []byte) bool {
	return etagLine.Match(a) && etagLine.Match(b) &&
		bytes.Equal(etagLine.ReplaceAll(a, nil), etagLine.ReplaceAll(b, nil))
}

func slurpURL(urlStr string) []byte {
	diskFile := filepath.Join(os.TempDir(), "google-api-cache-"+url.QueryEscape(urlStr))
	if *useCache {
		bs, err := ioutil.ReadFile(diskFile)
		if err == nil && len(bs) > 0 {
			return bs
		}
	}

	req, err := http.NewRequest("GET", urlStr, nil)
	if err != nil {
		log.Fatal(err)
	}
	if *publicOnly {
		req.Header.Add("X-User-IP", "0.0.0.0") // hack
	}
	res, err := http.DefaultClient.Do(req)
	if err != nil {
		log.Fatalf("Error fetching URL %s: %v", urlStr, err)
	}
	bs, err := ioutil.ReadAll(res.Body)
	if err != nil {
		log.Fatalf("Error reading body of URL %s: %v", urlStr, err)
	}
	if *useCache {
		if err := ioutil.WriteFile(diskFile, bs, 0666); err != nil {
			log.Printf("Warning: failed to write JSON of %s to disk file %s: %v", urlStr, diskFile, err)
		}
	}
	return bs
}

func panicf(format string, args ...interface{}) {
	panic(fmt.Sprintf(format, args...))
}

// namePool keeps track of used names and assigns free ones based on a
// preferred name
type namePool struct {
	m map[string]bool // lazily initialized
}

func (p *namePool) Get(preferred string) string {
	if p.m == nil {
		p.m = make(map[string]bool)
	}
	name := preferred
	tries := 0
	for p.m[name] {
		tries++
		name = fmt.Sprintf("%s%d", preferred, tries)
	}
	p.m[name] = true
	return name
}

func (a *API) SourceDir() string {
	if *genDir == "" {
		paths := filepath.SplitList(os.Getenv("GOPATH"))
		if len(paths) > 0 && paths[0] != "" {
			*genDir = filepath.Join(paths[0], "src", "google.golang.org", "api")
		}
	}
	return filepath.Join(*genDir, a.Package(), a.Version)
}

func (a *API) DiscoveryURL() string {
	if a.DiscoveryLink == "" {
		log.Fatalf("API %s has no DiscoveryLink", a.ID)
	}
	base, _ := url.Parse(*apisURL)
	u, err := base.Parse(a.DiscoveryLink)
	if err != nil {
		log.Fatalf("API %s has bogus DiscoveryLink %s: %v", a.ID, a.DiscoveryLink, err)
	}
	return u.String()
}

func (a *API) Package() string {
	return strings.ToLower(a.Name)
}

func (a *API) Target() string {
	return fmt.Sprintf("google.golang.org/api/%s/%s", a.Package(), a.Version)
}

// GetName returns a free top-level function/type identifier in the package.
// It tries to return your preferred match if it's free.
func (a *API) GetName(preferred string) string {
	return a.usedNames.Get(preferred)
}

func (a *API) apiBaseURL() string {
	if a.RootURL != "" {
		return a.RootURL + a.ServicePath
	}
	return resolveRelative(*apisURL, jstr(a.m, "basePath"))
}

func (a *API) needsDataWrapper() bool {
	for _, feature := range jstrlist(a.m, "features") {
		if feature == "dataWrapper" {
			return true
		}
	}
	return false
}

func (a *API) jsonBytes() []byte {
	if v := a.forceJSON; v != nil {
		return v
	}
	return slurpURL(a.DiscoveryURL())
}

func (a *API) WriteGeneratedCode() error {
	outdir := a.SourceDir()
	err := os.MkdirAll(outdir, 0755)
	if err != nil {
		return fmt.Errorf("failed to Mkdir %s: %v", outdir, err)
	}

	pkg := a.Package()
	name := filepath.Join(outdir, a.Package()+"-api.json")
	fmt.Printf("json %s\n", name)
	writeFile(name, a.jsonBytes())

	genfilename := *output
	if genfilename == "" {
		genfilename = filepath.Join(outdir, pkg+"-gen.swift")
	}

	fmt.Printf("code %s\n", genfilename)
	code, err := a.GenerateCode()
	errw := writeFile(genfilename, code)
	if err == nil {
		err = errw
	}
	return err
}

var docsLink string

func (a *API) GenerateCode() ([]byte, error) {
	var indent = swiftIndent + swiftIndent 
	pkg := a.Package()

	a.m = make(map[string]interface{})
	m := a.m
	jsonBytes := a.jsonBytes()
	err := json.Unmarshal(jsonBytes, &a.m)
	if err != nil {
		return nil, err
	}
	// Because the Discovery JSON may not have all the fields populated that the actual
	// API JSON has (e.g. rootUrl and servicePath), the API should be repopulated from
	// the JSON here.
	if err := json.Unmarshal(jsonBytes, a); err != nil {
		return nil, err
	}

	// Buffer the output in memory, for gofmt'ing later in the defer.
	var buf bytes.Buffer
	a.p = func(format string, args ...interface{}) {
		_, err := fmt.Fprintf(&buf, format, args...)
		if err != nil {
			panic(err)
		}
	}
	a.pn = func(format string, args ...interface{}) {
		a.p(format+"\n", args...)
	}

	p, pn := a.p, a.pn
	reslist := a.Resources(a.m, "")


	p("// Package %s provides access to the %s.\n", pkg, jstr(m, "title"))
	docsLink = jstr(m, "documentationLink")
	if docsLink != "" {
		p("//\n")
		p("// See %s\n", docsLink)
	}
	p("//\n// Usage example:\n")
	p("//\n")
	p("//   import %q\n", a.Target())
	p("//   ...\n")
	p("//   %sService, err := %s.New(oauthHttpClient)\n", pkg, pkg)

	pn("import Foundation")
	pn("import Alamofire")
	pn("import Argo")
	pn("import Runes")			
	p("\n")
	pn(`public typealias Field =  String`)
	pn(``)
	pn(`public func CombineFields( fields: [Field] ) -> String {`)
	pn(`    var strings = [String]()`)
	pn(`    for (index, value) in fields.enumerate() {`)
	pn(`	strings[index] = "\(value)"`)
	pn(`    }`)
	pn(`    return strings.joinWithSeparator(",")`)
	pn(`}	`)
	//p("package %s\n", pkg)
	p("public struct %s {\n", pkg)

	// p("import (\n")
	// for _, pkg := range []string{
	// 	"bytes",
	// 	*googleAPIPkg,
	// 	"encoding/json",
	// 	"errors",
	// 	"fmt",
	// 	"io",
	// 	"net/http",
	// 	"net/url",
	// 	"strconv",
	// 	"strings",
	// 	*contextPkg,
	// } {
	// 	p("\t%q\n", pkg)
	// }
	// p(")\n\n")
	// pn("// Always reference these packages, just in case the auto-generated code")
	// pn("// below doesn't.")
	// pn("var _ = bytes.NewBuffer")
	// pn("var _ = strconv.Itoa")
	// pn("var _ = fmt.Sprintf")
	// pn("var _ = json.NewDecoder")
	// pn("var _ = io.Copy")
	// pn("var _ = url.Parse")
	// pn("var _ = googleapi.Version")
	// pn("var _ = errors.New")
	// pn("var _ = strings.Replace")
	// pn("var _ = context.Background")
	// pn("")
	pn(swiftIndent + "static let apiId = %q", jstr(m, "id"))
	pn(swiftIndent + "static let apiName = %q", jstr(m, "name"))
	pn(swiftIndent + "static let apiVersion = %q", jstr(m, "version"))
	pn(swiftIndent + "static let basePath = %q", a.apiBaseURL())
	p("\n")
	p("// MARK: scope constants\n")	
	a.generateScopeConstants(swiftIndent)
	p("\n")
	a.GetName("New") // ignore return value; we're the first caller	
	pn(swiftIndent + "static func New(client: Alamofire.Manager) -> Service {")
	pn(indent + "return Service( client: client, BasePath: %s.basePath)", pkg)
	/* trying out lazy
	for _, res := range reslist { // add top level resources.
		pn(indent + "%s = %s(s)", res.GoField(), res.SwiftType())
	}
*/
	//pn(indent + "return s, nil")
	pn(swiftIndent + "}")		
	p("}\n")	

	
	p("//service\n")
	a.GetName("Service") // ignore return value; no user-defined names yet
	p("\npublic class Service {\n")
	pn(swiftIndent + "private init(client: Alamofire.Manager, BasePath: String) {")
	pn("%sself.client = client", swiftIndent + swiftIndent)
	pn("%sself.BasePath = BasePath", swiftIndent + swiftIndent)		
	// for _, res := range reslist {
	// 	pn("%sself.%s = %s(s: self)", swiftIndent + swiftIndent, res.GoField(), res.SwiftType())
	// }	
	pn(swiftIndent + "}")
	p(swiftIndent + "let client: Alamofire.Manager\n")
	p(swiftIndent + "let BasePath: String // API endpoint base URL\n")

	for _, res := range reslist {
		p("%slazy var %s: %s = { [unowned self] in ", swiftIndent, res.GoField(), res.SwiftType())
		pn("return %s(client: self.client) }()", res.SwiftType())
	}
	pn("")

	p("}\n")

	p("// MARK: res generatetype\n")
	for _, res := range reslist {
		res.generateType()
	}

	a.PopulateSchemas()
	p("// MARK: schema code\n")
	for _, name := range a.sortedSchemaNames() {
		a.schemas[name].writeSchemaCode(swiftIndent, a)
	}
	p("// MARK: meth code\n")
	for _, meth := range a.APIMethods() {
		meth.generateCode()
	}
	p("// MARK: res methods\n")
	for _, res := range reslist {
		res.generateMethods()
	}
	return buf.Bytes(), err
}

func (a *API) generateScopeConstants(indent string) {
	auth := jobj(a.m, "auth")
	if auth == nil {
		return
	}
	oauth2 := jobj(auth, "oauth2")
	if oauth2 == nil {
		return
	}
	scopes := jobj(oauth2, "scopes")
	if scopes == nil || len(scopes) == 0 {
		return
	}

	a.p(indent + "// OAuth2 scopes used by this API.\n")
	a.p(indent + "struct scope {\n")
	n := 0
	for _, scopeName := range sortedKeys(scopes) {
		mi := scopes[scopeName]
		if n > 0 {
			a.p( "\n")
		}
		n++
		ident := scopeIdentifierFromURL(scopeName)
		if des := jstr(mi.(map[string]interface{}), "description"); des != "" {
			a.p("%s", asComment(indent + swiftIndent, des))
		}
		a.p(indent + swiftIndent + "static let %s = %q\n", ident, scopeName)
	}
	a.p(indent + "}\n\n")
}

func scopeIdentifierFromURL(urlStr string) string {
	const prefix = "https://www.googleapis.com/auth/"
	if !strings.HasPrefix(urlStr, prefix) {
		const https = "https://"
		if !strings.HasPrefix(urlStr, https) {
			log.Fatalf("Unexpected oauth2 scope %q doesn't start with %q", urlStr, https)
		}
		ident := validGoIdentifer(depunct(urlStr[len(https):], true)) + "Scope"
		return ident
	}
	ident := validGoIdentifer(initialCap(urlStr[len(prefix):])) + "Scope"
	return ident
}

type Schema struct {
	api *API
	m   map[string]interface{} // original JSON map

	typ *Type // lazily populated by Type

	apiName      string // the native API-defined name of this type
	goName       string // lazily populated by GoName
	goReturnType string // lazily populated by GoReturnType
}

type Property struct {
	s       *Schema                // property of which schema
	apiName string                 // the native API-defined name of this property
	m       map[string]interface{} // original JSON map

	typ *Type // lazily populated by Type
}

func (p *Property) Type() *Type {
	if p.typ == nil {
		p.typ = &Type{api: p.s.api, m: p.m}
	}
	return p.typ
}

func (p *Property) GoName() string {
	return initialCap(p.apiName)
}

func (p *Property) APIName() string {
	return p.apiName
}

func (p *Property) Description() string {
	return jstr(p.m, "description")
}

type Type struct {
	m   map[string]interface{} // JSON map containing key "type" and maybe "items", "properties"
	api *API
}

func (t *Type) apiType() string {
	// Note: returns "" on reference types
	if t, ok := t.m["type"].(string); ok {
		return t
	}
	return ""
}

func (t *Type) apiTypeFormat() string {
	if f, ok := t.m["format"].(string); ok {
		return f
	}
	return ""
}

func (t *Type) isIntAsString() bool {
	return t.apiType() == "string" && strings.Contains(t.apiTypeFormat(), "int")
}

func (t *Type) asSimpleGoType() (goType string, ok bool) {
	return simpleTypeConvert(t.apiType(), t.apiTypeFormat())
}

func (t *Type) asSimpleSwiftType() (goType string, ok bool) {
	return simpleSwiftTypeConvert(t.apiType(), t.apiTypeFormat())
}


func (t *Type) String() string {
	return fmt.Sprintf("[type=%q, map=%s]", t.apiType(), prettyJSON(t.m))
}

func (t *Type) AsGo() string {
	if t, ok := t.asSimpleGoType(); ok {
		return t
	}
	if at, ok := t.ArrayType(); ok {
		if at.apiType() == "string" {
			switch at.apiTypeFormat() {
			case "int64":
				return "googleapi.Int64s"
			case "uint64":
				return "googleapi.Uint64s"
			case "int32":
				return "googleapi.Int32s"
			case "uint32":
				return "googleapi.Uint32s"
			case "float64":
				return "googleapi.Float64s"
			default:
				return "[]" + at.AsGo()
			}
		}
		return "[]" + at.AsGo()
	}
	if ref, ok := t.Reference(); ok {
		s := t.api.schemas[ref]
		if s == nil {
			panic(fmt.Sprintf("in Type.AsGo(), failed to find referenced type %q for %s",
				ref, prettyJSON(t.m)))
		}
		return s.Type().AsGo()
	}
	if typ, ok := t.MapType(); ok {
		return typ
	}
	if t.IsStruct() {
		if apiName, ok := t.m["_apiName"].(string); ok {
			s := t.api.schemas[apiName]
			if s == nil {
				panic(fmt.Sprintf("in Type.AsGo, _apiName of %q didn't point to a valid schema; json: %s",
					apiName, prettyJSON(t.m)))
			}
			if v := jobj(s.m, "variant"); v != nil {
				return s.GoName()
			}
			return "*" + s.GoName()
		}
		panic("in Type.AsGo, no _apiName found for struct type " + prettyJSON(t.m))
	}
	panic("unhandled Type.AsGo for " + prettyJSON(t.m))
}

func (t *Type) AsSwift() string {
	if t, ok := t.asSimpleSwiftType(); ok {
		
		return t
	}
	if at, ok := t.ArrayType(); ok {
		if at.apiType() == "string" {
			switch at.apiTypeFormat() {
			case "int64":
				return "googleapi.Int64s"
			case "uint64":
				return "googleapi.Uint64s"
			case "int32":
				return "googleapi.Int32s"
			case "uint32":
				return "googleapi.Uint32s"
			case "float64":
				return "googleapi.Float64s"
			default:
				return "[" + at.AsSwift() + "]"
			}
		}
		return "[" + at.AsSwift() + "]"
	}
	if ref, ok := t.Reference(); ok {
		s := t.api.schemas[ref]
		if s == nil {
			panic(fmt.Sprintf("in Type.AsSwift(), failed to find referenced type %q for %s",
				ref, prettyJSON(t.m)))
		}
		return s.Type().AsSwift()
	}
	if typ, ok := t.MapType(); ok {
		return typ
	}
	if t.IsStruct() {
		if apiName, ok := t.m["_apiName"].(string); ok {
			s := t.api.schemas[apiName]
			if s == nil {
				panic(fmt.Sprintf("in Type.AsSwift, _apiName of %q didn't point to a valid schema; json: %s",
					apiName, prettyJSON(t.m)))
			}
			if v := jobj(s.m, "variant"); v != nil {
				return s.SwiftName()
			}
			// optional?
			return s.SwiftName() + "?"
		}
		panic("in Type.AsSwift, no _apiName found for struct type " + prettyJSON(t.m))
	}
	panic("unhandled Type.AsSwift for " + prettyJSON(t.m))
}

func (t *Type) IsSimple() bool {
	_, ok := simpleTypeConvert(t.apiType(), t.apiTypeFormat())
	return ok
}

func (t *Type) IsStruct() bool {
	return t.apiType() == "object"
}

func (t *Type) Reference() (apiName string, ok bool) {
	apiName = jstr(t.m, "$ref")
	ok = apiName != ""
	return
}

func (t *Type) IsMap() bool {
	_, ok := t.MapType()
	return ok
}

// MapType checks if the current node is a map and if true, it returns the Go type for the map, such as map[string]string.
func (t *Type) MapType() (typ string, ok bool) {
	dictionaryTemplate := "[String: %s]"
	props := jobj(t.m, "additionalProperties")
	if props == nil {
		return "", false
	}
	s := jstr(props, "type")
	if s == "string" {
		return fmt.Sprintf(dictionaryTemplate, "String"), true
	}
	if s != "array" {
		if s == "" { // Check for reference
			s = jstr(props, "$ref")
			if s != "" {
				return fmt.Sprintf(dictionaryTemplate, s), true
			}
		}
		log.Printf("Warning: found map to type %q which is not implemented yet.", s)
		return "", false
	}
	items := jobj(props, "items")
	if items == nil {
		return "", false
	}
	s = jstr(items, "type")
	if s != "string" {
		if s == "" { // Check for reference
			s = jstr(items, "$ref")
			if s != "" {
				return "map[string][]" + s, true
			}
		}
		log.Printf("Warning: found map of arrays of type %q which is not implemented yet.", s)
		return "", false
	}
	return "map[string][]string", true
}

func (t *Type) IsReference() bool {
	return jstr(t.m, "$ref") != ""
}

func (t *Type) ReferenceSchema() (s *Schema, ok bool) {
	apiName, ok := t.Reference()
	if !ok {
		return
	}

	s = t.api.schemas[apiName]
	if s == nil {
		panicf("failed to find t.api.schemas[%q] while resolving reference",
			apiName)
	}
	return s, true
}

func (t *Type) ArrayType() (elementType *Type, ok bool) {
	if t.apiType() != "array" {
		return
	}
	items := jobj(t.m, "items")
	if items == nil {
		panicf("can't handle array type missing its 'items' key. map is %#v", t.m)
	}
	return &Type{api: t.api, m: items}, true
}

func (s *Schema) Type() *Type {
	if s.typ == nil {
		s.typ = &Type{api: s.api, m: s.m}
	}
	return s.typ
}

func (s *Schema) properties() []*Property {
	if !s.Type().IsStruct() {
		panic("called properties on non-object schema")
	}
	pl := []*Property{}
	propMap := jobj(s.m, "properties")
	for _, name := range sortedKeys(propMap) {
		m := propMap[name].(map[string]interface{})
		pl = append(pl, &Property{
			s:       s,
			m:       m,
			apiName: name,
		})
	}
	return pl
}

func (s *Schema) populateSubSchemas() (outerr error) {
	defer func() {
		r := recover()
		if r == nil {
			return
		}
		outerr = fmt.Errorf("%v", r)
	}()

	addSubStruct := func(subApiName string, t *Type) {
		if s.api.schemas[subApiName] != nil {
			panic("dup schema apiName: " + subApiName)
		}
		subm := t.m
		subm["_apiName"] = subApiName
		subs := &Schema{
			api:     s.api,
			m:       subm,
			typ:     t,
			apiName: subApiName,
		}
		s.api.schemas[subApiName] = subs
		err := subs.populateSubSchemas()
		if err != nil {
			panicf("in sub-struct %q: %v", subApiName, err)
		}
	}

	if s.Type().IsStruct() {
		for _, p := range s.properties() {
			if p.Type().IsSimple() || p.Type().IsMap() {
				continue
			}
			if at, ok := p.Type().ArrayType(); ok {
				if at.IsSimple() || at.IsReference() {
					continue
				}
				subApiName := fmt.Sprintf("%s.%s", s.apiName, p.apiName)
				if at.IsStruct() {
					addSubStruct(subApiName, at) // was p.Type()?
					continue
				}
				if _, ok := at.ArrayType(); ok {
					addSubStruct(subApiName, at)
					continue
				}
				panicf("Unknown property array type for %q: %s", subApiName, at)
				continue
			}
			subApiName := fmt.Sprintf("%s.%s", s.apiName, p.apiName)
			if p.Type().IsStruct() {
				addSubStruct(subApiName, p.Type())
				continue
			}
			if p.Type().IsReference() {
				continue
			}
			panicf("Unknown type for %q: %s", subApiName, p.Type())
		}
		return
	}

	if at, ok := s.Type().ArrayType(); ok {
		if at.IsSimple() || at.IsReference() {
			return
		}
		subApiName := fmt.Sprintf("%s.Item", s.apiName)

		if at.IsStruct() {
			addSubStruct(subApiName, at)
			return
		}
		if at, ok := at.ArrayType(); ok {
			if at.IsSimple() || at.IsReference() {
				return
			}
			addSubStruct(subApiName, at)
			return
		}
		panicf("Unknown array type for %q: %s", subApiName, at)
		return
	}

	if s.Type().IsSimple() || s.Type().IsReference() {
		return
	}

	fmt.Fprintf(os.Stderr, "in populateSubSchemas, schema is: %s", prettyJSON(s.m))
	panicf("populateSubSchemas: unsupported type for schema %q", s.apiName)
	panic("unreachable")
}

// GoName returns (or creates and returns) the bare Go name
// of the apiName, making sure that it's a proper Go identifier
// and doesn't conflict with an existing name.
func (s *Schema) GoName() string {
	if s.goName == "" {
		if name, ok := s.Type().MapType(); ok {
			s.goName = name
		} else {
			s.goName = s.api.GetName(initialCap(s.apiName))
		}
	}
	return s.goName
}

func (s *Schema) SwiftName() string {
	if s.goName == "" {
		if name, ok := s.Type().MapType(); ok {
			s.goName = name
		} else {
			s.goName = s.api.GetName(initialCap(s.apiName))
		}
	}
	return s.goName
}

// GoReturnType returns the Go type to use as the return type.
// If a type is a struct, it will return *StructType,
// for a map it will return map[string]ValueType,
// for (not yet supported) slices it will return []ValueType.
func (s *Schema) GoReturnType() string {
	if s.goReturnType == "" {
		if s.Type().IsMap() {
			s.goReturnType = s.GoName()
		} else {
			s.goReturnType = "*" + s.GoName()
		}
	}
	return s.goReturnType
}

func (s *Schema) SwiftReturnType() string {
	if s.goReturnType == "" {
		if s.Type().IsMap() {
			s.goReturnType = s.SwiftName()
		} else {
			s.goReturnType = s.SwiftName()
		}
	}
	return s.goReturnType
}

func (s *Schema) writeSchemaCode(indent string, api *API) {
	s.api.pn("// writeSchemaCode")
	if s.Type().IsStruct() && !s.Type().IsMap() {
		s.writeSchemaStruct(indent, api)
		return
	}

	if _, ok := s.Type().ArrayType(); ok {
		s.api.pn("//TODO writeSchemaCode for arrays for %s", s.GoName())		
		log.Printf("TODO writeSchemaCode for arrays for %s", s.GoName())
		return
	}

	if destSchema, ok := s.Type().ReferenceSchema(); ok {
		// Convert it to a struct using embedding.
		s.api.p("\nstruct %s: JSONDecodable {\n // REFERENCE", s.SwiftName())
		s.api.p("\t%s\n", destSchema.SwiftName())
		s.api.p("}\n")
		return
	}

	if s.Type().IsSimple() {
		apitype := jstr(s.m, "type")
		typ := mustSimpleTypeConvert(apitype, jstr(s.m, "format"))
		s.api.p("\ntype %s %s\n", s.SwiftName(), typ)
		return
	}

	if s.Type().IsMap() {
		return
	}

	fmt.Fprintf(os.Stderr, "in writeSchemaCode, schema is: %s", prettyJSON(s.m))
	panicf("writeSchemaCode: unsupported type for schema %q", s.apiName)
}

// TODO: not converted to swift
func (s *Schema) writeVariant(api *API, v map[string]interface{}) {
	s.api.pn("\nSchema writeVariant")
	s.api.p("type %s map[string]interface{}\n\n", s.GoName())

	// Write out the "Type" method that identifies the variant type.
	s.api.p("func (t %s) Type() string {\n", s.GoName())
	s.api.p("  return googleapi.VariantType(t)\n")
	s.api.p("}\n\n")

	// Write out helper methods to convert each possible variant.
	for _, m := range jobjlist(v, "map") {
		val := jstr(m, "type_value")
		reftype := jstr(m, "$ref")
		if val == "" && reftype == "" {
			log.Printf("TODO variant %s ref %s not yet supported.", val, reftype)
			continue
		}

		_, ok := api.schemas[reftype]
		if !ok {
			log.Printf("TODO variant %s ref %s not yet supported.", val, reftype)
			continue
		}

		s.api.p("func (t %s) %s() (r %s, ok bool) {\n", s.GoName(), initialCap(val), reftype)
		s.api.p("  if t.Type() != %q {\n", initialCap(val))
		s.api.p("    return r, false\n")
		s.api.p("  }\n")
		s.api.p("  ok = googleapi.ConvertVariant(map[string]interface{}(t), &r)\n")
		s.api.p("  return r, ok\n")
		s.api.p("}\n\n")
	}
}

func (s *Schema) writeSchemaStruct(indent string, api *API) {
	s.api.pn("\n// writeSchemaStruct")
	if v := jobj(s.m, "variant"); v != nil {
		s.writeVariant(api, v)
		return
	}
	// TODO: description
	s.api.p("\nstruct %s: JSONDecodable {\n", s.GoName())
	for i, p := range s.properties() {
		if i > 0 {
			s.api.p("\n")
		}
		pname := validSwiftIdentifer(p.apiName)
		if des := p.Description(); des != "" {
			s.api.p("%s", asComment(indent, fmt.Sprintf("%s: %s", pname, des)))
		}
		var extraOpt string
		if p.Type().isIntAsString() {
			extraOpt += ",string"
		}
		s.api.p(indent + "let %s: %s //  json:\"%s,omitempty%s\" \n", pname, p.Type().AsSwift(),
			p.APIName(), extraOpt)

	}

	// create function
	s.api.p("\n" + indent + "static func create(")
	for i, p := range s.properties() {
		if i > 0 {
			s.api.p(")(")
		}
		pname := validSwiftIdentifer(p.apiName)
		ptype := p.Type().AsSwift()
		s.api.p("%s: %s", pname, ptype)

	}
	s.api.p(") -> %s {\n", s.GoName())
	s.api.p(indent + swiftIndent + "return %s(", s.GoName())
	for i, p := range s.properties() {
		if i > 0 {
			s.api.p(", ")
		}
		pname := validSwiftIdentifer(p.apiName)
		s.api.p("%s: %s", pname, pname)
		
	}
	s.api.p(")\n")
	s.api.pn(indent + "}")

	// decode function
	s.api.p("\n" + indent + "static func decode (j: JSON) -> Decoded<%s> {\n", s.GoName())
	s.api.pn(indent + swiftIndent + "return %s.create",  s.GoName())
	for i, p := range s.properties() {
		if i > 0 {
			s.api.p(indent + swiftIndent + swiftIndent + "<*> ")
		} else {
			s.api.p(indent + swiftIndent + swiftIndent + "<^> ")
		}
		
		pname := p.apiName
		// TODO: Can't have all conditional types in structs
		if _, ok := p.Type().ArrayType(); ok {	
			s.api.pn(`j <|| "%s"`, pname)
		} else {
			s.api.pn(`j <| "%s"`, pname)			
		}

	}
	s.api.pn(indent + "}")
	s.api.p("}\n")
}

// PopulateSchemas reads all the API types ("schemas") from the JSON file
// and converts them to *Schema instances, returning an identically
// keyed map, additionally containing subresources.  For instance,
//
// A resource "Foo" of type "object" with a property "bar", also of type
// "object" (an anonymous sub-resource), will get a synthetic API name
// of "Foo.bar".
//
// A resource "Foo" of type "array" with an "items" of type "object"
// will get a synthetic API name of "Foo.Item".
func (a *API) PopulateSchemas() {
	m := jobj(a.m, "schemas")
	if a.schemas != nil {
		panic("")
	}
	a.schemas = make(map[string]*Schema)
	for name, mi := range m {
		for _,reg := range serviceFilter {
			if matched, _ := regexp.MatchString(reg, name); matched {			
				s := &Schema{
					api:     a,
					apiName: name,
					m:       mi.(map[string]interface{}),
				}
				
				// And a little gross hack, so a map alone is good
				// enough to get its apiName:
				s.m["_apiName"] = name
				
				a.schemas[name] = s
				err := s.populateSubSchemas()
				if err != nil {
					panicf("Error populating schema with API name %q: %v", name, err)
				}
				break
			}
		}
	}
}

type Resource struct {
	api       *API
	name      string
	parent    string
	m         map[string]interface{}
	resources []*Resource
}


func (r *Resource) generateType() {
	p, pn := r.api.p, r.api.pn
	t := r.SwiftType()
	var indent = swiftIndent
	pn(fmt.Sprintf("struct %s {", t))
	pn(indent + "let client: Alamofire.Manager")
	//pn(indent + "let s: Service")
	//pn(indent + "var rs: %s { get { return self } }", t)		
	//pn(indent + "rs := &%s{s : s}", t)
	//TODO: what uses this?
	for _, res := range r.resources {
		pn("// rs.%s = New%s(s)", res.GoField(), res.SwiftType())
	}
	pn("}")
	p("")
	/*
	p("\nstruct %s {\n", t)
	p("\ts *Service\n")
	for _, res := range r.resources {
		p("\n\t%s\t*%s\n", res.GoField(), res.SwiftType())
	}
	p("}\n")
*/
	for _, res := range r.resources {
		res.generateType()
	}
}

func (r *Resource) generateMethods() {
	for _, meth := range r.Methods() {
		meth.generateCode()
	}
	for _, res := range r.resources {
		res.generateMethods()
	}
}

func (r *Resource) GoField() string {
	return initialCap(r.name)
}

func (r *Resource) GoType() string {
	return initialCap(fmt.Sprintf("%s.%s", r.parent, r.name)) + "Service"
}

func (r *Resource) SwiftType() string {
	return initialCap(fmt.Sprintf("%s.%s", r.parent, r.name)) + "Service"
}

func (r *Resource) Methods() []*Method {
	ms := []*Method{}

	methMap := jobj(r.m, "methods")
	for _, mname := range sortedKeys(methMap) {
		mi := methMap[mname]
		ms = append(ms, &Method{
			api:  r.api,
			r:    r,
			name: mname,
			m:    mi.(map[string]interface{}),
		})
	}
	return ms
}

type Method struct {
	api  *API
	r    *Resource // or nil if a API-level (top-level) method
	name string
	m    map[string]interface{} // original JSON

	params []*Param // all Params, of each type, lazily set by first access to Parameters
}

func (m *Method) Id() string {
	return jstr(m.m, "id")
}

func (m *Method) supportsMediaUpload() bool {
	return jobj(m.m, "mediaUpload") != nil
}

func (m *Method) mediaUploadPath() string {
	return jstr(jobj(jobj(jobj(m.m, "mediaUpload"), "protocols"), "simple"), "path")
}

func (m *Method) Params() []*Param {
	if m.params == nil {
		paramMap := jobj(m.m, "parameters")
		for _, name := range sortedKeys(paramMap) {
			mi := paramMap[name]
			pm := mi.(map[string]interface{})
			m.params = append(m.params, &Param{
				name:   name,
				m:      pm,
				method: m,
			})
		}
	}
	return m.params
}

func (m *Method) grepParams(f func(*Param) bool) []*Param {
	matches := make([]*Param, 0)
	for _, param := range m.Params() {
		if f(param) {
			matches = append(matches, param)
		}
	}
	return matches
}

func (m *Method) NamedParam(name string) *Param {
	matches := m.grepParams(func(p *Param) bool {
		return p.name == name
	})
	if len(matches) < 1 {
		log.Panicf("failed to find named parameter %q", name)
	}
	if len(matches) > 1 {
		log.Panicf("found multiple parameters for parameter name %q", name)
	}
	return matches[0]
}

func (m *Method) OptParams() []*Param {
	return m.grepParams(func(p *Param) bool {
		return !p.IsRequired()
	})
}

func (m *Method) RequiredRepeatedQueryParams() []*Param {
	return m.grepParams(func(p *Param) bool {
		return p.IsRequired() && p.IsRepeated() && p.Location() == "query"
	})
}

func (m *Method) RequiredQueryParams() []*Param {
	return m.grepParams(func(p *Param) bool {
		return p.IsRequired() && !p.IsRepeated() && p.Location() == "query"
	})
}

func (meth *Method) generateCode() {
	
	res := meth.r // may be nil if a top-level method
	a := meth.api
	p, pn := a.p, a.pn

	pn("\n// method id %q:", meth.Id())
	pn("// meth generateCode")

	retType := responseType(a, meth.m)
	retTypeComma := retType
	if retTypeComma != "" {
		retTypeComma += ", "
	}

	args := meth.NewArguments()
	methodName := meth.name
	prefix := ""
	if res != nil {
		prefix = initialCap(fmt.Sprintf("%s.%s", res.parent, res.name))
	}
	callName := a.GetName(prefix + initialCap(methodName) + "Call")
	pn("// // ...Call struct")
	p("\nstruct %s {\n", callName)
	p(swiftIndent + "let client: Alamofire.Manager\n")
	p(swiftIndent + "var opt_: [String: String]\n")	
	for _, arg := range args.l {
		p(swiftIndent + "var %s: %s\n", arg.goname, arg.gotype)
	}

	if meth.supportsMediaUpload() {
		pn("/* TODO: upload support")
		p("\tmedia_     io.Reader\n")
		p("\tresumable_ googleapi.SizeReaderAt\n")
		p("\tmediaType_ string\n")
		p("\tctx_       context.Context\n")
		p("\tprotocol_  string\n")
		pn(" TODO: upload support */")		
	}
	p("}\n")

	p("\n%s", asComment("", methodName+": "+jstr(meth.m, "description")))
	if res != nil {
		if url := canonicalDocsURL[fmt.Sprintf("%v%v/%v", docsLink, res.name, meth.name)]; url != "" {
			pn("// For details, see %v", url)
		}
	}

	var servicePtr string
	pn("// // ...Service extension")
	if res == nil {
		p("extension %s {\n", "Service") 


	} else {
		p("extension %s {\n", res.SwiftType())
	}
	p(swiftIndent + "func %s(%s) -> %s {\n", methodName, args, callName)
	servicePtr = "client"					

	var indent = swiftIndent + swiftIndent 
	p(indent + "var c = %s(\n", callName)
	pn(indent + swiftIndent + "client: %s,", servicePtr)
	p(indent + swiftIndent + "opt_: Dictionary<String, String>()")
	for _, arg := range args.l {
		p(",\n" + indent + swiftIndent + "%s: %s", arg.goname, arg.goname)
	}
	pn("\n" + indent + swiftIndent + ")")
	p(indent + "return c\n")
	p(swiftIndent + "}\n")
	pn("}")	
	pn("")
	
	pn("// // ...Call extension")
	pn("extension %s {", callName)


	servicePtr = "client"	
	for _, opt := range meth.OptParams() {
		setter := opt.name
		des := jstr(opt.m, "description")
		des = strings.Replace(des, "Optional.", "", 1)
		des = strings.TrimSpace(des)
		p("\n%s", asComment(swiftIndent, fmt.Sprintf("%s sets the optional parameter %q: %s", setter, opt.name, des)))
		np := new(namePool)
		np.Get("c") // take the receiver's name
		paramName := np.Get(validSwiftIdentifer(opt.name))
		p(swiftIndent + "mutating func %s(%s: %s) -> %s {\n", setter, paramName, opt.SwiftType(), callName)
		pn(indent + `self.opt_[%q] = "\(%s)"`, opt.name, paramName)
		p(indent + "return self\n")
		p(swiftIndent + "}\n")
	}

	if meth.supportsMediaUpload() {
		pn("//TODO: convert media upload")
		/* 
		pn("\n// Media specifies the media to upload in a single chunk.")
		pn("// At most one of Media and ResumableMedia may be set.")
		pn("func (c *%s) Media(r io.Reader) *%s {", callName, callName)
		pn("c.media_ = r")
		pn(`c.protocol_ = "multipart"`)
		pn("return c")
		pn("}")
		pn("\n// ResumableMedia specifies the media to upload in chunks and can be cancelled with ctx.")
		pn("// At most one of Media and ResumableMedia may be set.")
		pn(`// mediaType identifies the MIME media type of the upload, such as "image/png".`)
		pn(`// If mediaType is "", it will be auto-detected.`)
		pn("func (c *%s) ResumableMedia(ctx context.Context, r io.ReaderAt, size int64, mediaType string) *%s {", callName, callName)
		pn("c.ctx_ = ctx")
		pn("c.resumable_ = io.NewSectionReader(r, 0, size)")
		pn("c.mediaType_ = mediaType")
		pn(`c.protocol_ = "resumable"`)
		pn("return c")
		pn("}")
		pn("\n// ProgressUpdater provides a callback function that will be called after every chunk.")
		pn("// It should be a low-latency function in order to not slow down the upload operation.")
		pn("// This should only be called when using ResumableMedia (as opposed to Media).")
		pn("func (c *%s) ProgressUpdater(pu googleapi.ProgressUpdater) *%s {", callName, callName)
		pn(`c.opt_["progressUpdater"] = pu`)
		pn("return c")
		pn("}")
*/
	}

	pn("\n" + swiftIndent + "// Fields allows partial responses to be retrieved.")
	pn(swiftIndent + "// See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse")
	pn(swiftIndent + "// for more information.")
	pn(swiftIndent + "mutating func fields(fields: Field...) -> %s {", callName)
	pn(indent + `self.opt_["fields"] = CombineFields(fields)`)
	pn(indent + "return self")
	pn(swiftIndent + "}")

	pn("\n" + swiftIndent + "func Do(block: (result: Decoded<%s>) -> () ) {", retType)

	// TODO: convert to swift"
	/*
	nilRet := ""
	if retTypeComma != "" {
		nilRet = "nil, "
	}
*/

	pn(indent + `let basePath = %s.basePath`, meth.api.Package())
	pn(indent + `let path = "%s"`, jstr(meth.m, "path"))
	pn(indent + `let url = NSURL(string: basePath + path)!`)
	pn(indent + "var headers = client.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()")
	
	//pn(indent + "var body io.Reader = nil")
	hasContentType := false
	httpMethod := jstr(meth.m, "httpMethod")
	if ba := args.bodyArg(); ba != nil && httpMethod != "GET" {
		/*
		style := "WithoutDataWrapper"
		if a.needsDataWrapper() {
			style = "WithDataWrapper"
		}
*/
		pn(indent + "// TODO: convert body to JSON")
		/*
		pn(indent + "body, err := googleapi.%s.JSONReader(c.%s)", style, ba.goname)
		pn(indent + "if err != nil { return %serr }", nilRet)*/
		pn(indent + `let ctype = "application/json"`)

		hasContentType = true
	}
	pn(indent + "var params = Dictionary<String, String>()")
	// Set this first. if they override it, though, might be gross.  We don't expect
	// XML replies elsewhere.  TODO(bradfitz): hide this option in the generated code?
	pn(indent + `params["alt"] = "json"`)
	for _, p := range meth.RequiredQueryParams() {
		pn(indent + `params[%q] = "\(self.%s)"`, p.name, p.goCallFieldName())
	}
	// TODO: where is this used?
	for _, p := range meth.RequiredRepeatedQueryParams() {
		pn(indent + `for _, v in self.%s { params[%q] = "\(v)" }`,
			p.name, p.name)
	}
	opts := meth.OptParams()
	opts = append(opts, &Param{name: "fields"})
	for _, p := range opts {
		// TODO: fix this if support xcode 6.2
		pn(indent + `if let v = self.opt_[%q] { params[%q] = "\(v)" }`,
			p.name, p.name)
	}

	//p(indent + "urls := googleapi.ResolveRelative(self.s.BasePath, %q)\n", jstr(meth.m, "path"))
	// TODO: convert to swift
	if meth.supportsMediaUpload() {
		pn( indent + "// TODO: Swift Media upload goes here" )
		/*
		pn( indent + "var progressUpdater_ googleapi.ProgressUpdater")
		pn( indent + "if v, ok := c.opt_[\"progressUpdater\"]; ok {")
		pn( indent + " if pu, ok := v.(googleapi.ProgressUpdater); ok {")
		pn( indent + "  progressUpdater_ = pu")
		pn( indent + " }")
		pn( indent + "}")
		pn( indent + "if c.media_ != nil || c.resumable_ != nil {")
		// Hack guess, since we get a 404 otherwise:
		//pn("urls = googleapi.ResolveRelative(%q, %q)", a.apiBaseURL(), meth.mediaUploadPath())
		// Further hack.  Discovery doc is wrong?
		pn( indent + "urls = strings.Replace(urls, %q, %q, 1)", "https://www.googleapis.com/", "https://www.googleapis.com/upload/")
		pn(indent + `params.Set("uploadType", c.protocol_)`)
		pn( indent + "}")
*/
	}
	if meth.supportsMediaUpload() && httpMethod != "GET" {
		pn( indent + "// TODO: Swift Media upload goes here" )
		/*
		if !hasContentType { // Support mediaUpload but no ctype set.
			pn( indent + "body = new(bytes.Buffer)")
			pn(`ctype := "application/json"`)
			hasContentType = true
		}
		pn(indent + `if c.protocol_ != "resumable" {`)
		pn(indent + `  var cancel func()`)
		pn( indent + "  cancel, _ = googleapi.ConditionallyIncludeMedia(c.media_, &body, &ctype)")
		pn( indent + "  if cancel != nil { defer cancel() }")
		pn( indent + "}")
*/
	}


	/*
        // TODO: need to be converted?
	// Replace param values after NewRequest to avoid reencoding them.
	// E.g. Cloud Storage API requires '%2F' in entity param to be kept, but url.Parse replaces it with '/'.
	argsForLocation := args.forLocation("path")
	if len(argsForLocation) > 0 {
		pn(indent + `googleapi.Expand(req.URL, map[string]string{`)
		for _, arg := range argsForLocation {
			pn(indent + `"%s": %s,`, arg.apiname, arg.exprAsString("c."))
		}
		pn(`})`)
	} else {
		// Just call SetOpaque since we aren't calling Expand
		pn(indent + `googleapi.SetOpaque(req.URL)`)
	}
*/

	if meth.supportsMediaUpload() {
		pn("// TODO: convert to swift")
		/*
		pn(indent + `if c.protocol_ == "resumable" {`)
		pn(indent + " req.ContentLength = 0")
		pn(indent + ` if c.mediaType_ == "" {`)
		pn(indent + "  c.mediaType_ = googleapi.DetectMediaType(c.resumable_)")
		pn(indent + " }")
		pn(indent + ` req.Header.Set(indent + "X-Upload-Content-Type", c.mediaType_)`)
		pn(indent + " req.Body = nil")
		pn(indent + "} else {")
		pn(indent + ` req.Header.Set(indent + "Content-Type", ctype)`)
		pn(indent + "}")
*/
	} else if hasContentType {
		pn(indent + `headers["Content-Type"] = ctype`)		
	}

	pn(indent + `headers["User-Agent"] = "google-api-swift-client/` + goGenVersion + `"`)
	//pn(indent + "client.session.configuration.HTTPAdditionalHeaders = headers")
	pn(indent + "var request = client.request(Alamofire.Method.%s, url, parameters: params)", httpMethod)	
	pn(indent + "request.responseJSON( completionHandler: { (request, response, result) in ")
	pn(indent + swiftIndent + "if result.isFailure {")
	pn(indent + swiftIndent + swiftIndent + `log.verbose("\(result.error)") // error handling`)	

	pn(indent + swiftIndent + "} else {")
	pn(indent + swiftIndent + swiftIndent + "if let json = result.value as? JSON {" )
	pn(indent + swiftIndent + swiftIndent + swiftIndent + "block(%s.decode(json))", retType)
	pn(indent + swiftIndent + swiftIndent + "}" )	
	pn(indent + swiftIndent + swiftIndent + `log.verbose("\(result.error)") // error handling`)
	pn(indent + swiftIndent + "}")	
	pn(indent + "})")
	//pn(indent + "if err != nil { return %serr }", nilRet)
	//pn(indent + "defer googleapi.CloseBody(res)")
	//pn(indent + "if err := googleapi.CheckResponse(res); err != nil { return %serr }", nilRet)
	if meth.supportsMediaUpload() {
		pn("// TODO: convert to swift")
		/*
		pn(indent + `if c.protocol_ == "resumable" {`)
		pn(indent + ` loc := res.Header.Get("Location")`)
		pn(indent + " rx := &googleapi.ResumableUpload{")
		pn(indent + "  Client:        c.s.client,")
		pn(indent + "  URI:           loc,")
		pn(indent + "  Media:         c.resumable_,")
		pn(indent + "  MediaType:     c.mediaType_,")
		pn(indent + "  ContentLength: c.resumable_.Size(),")
		pn(indent + "  Callback:      progressUpdater_,")
		pn(indent + " }")
		pn(indent + " res, err = rx.Upload(c.ctx_)")
		pn(indent + " if err != nil { return %serr }", nilRet)
		pn(indent + " defer res.Body.Close()")
		pn(indent + "}")
*/
	}
	pn(swiftIndent + "}")

	bs, _ := json.MarshalIndent(meth.m, "\t// ", "  ")
	pn(indent + "// %s\n", string(bs))
	pn("}")
}

type Param struct {
	method        *Method
	name          string
	m             map[string]interface{}
	callFieldName string // empty means to use the default
}

func (p *Param) IsRequired() bool {
	v, _ := p.m["required"].(bool)
	return v
}

func (p *Param) IsRepeated() bool {
	v, _ := p.m["repeated"].(bool)
	return v
}

func (p *Param) Location() string {
	return p.m["location"].(string)
}

func (p *Param) GoType() string {
	typ, format := jstr(p.m, "type"), jstr(p.m, "format")
	if typ == "string" && strings.Contains(format, "int") && p.Location() != "query" {
		panic("unexpected int parameter encoded as string, not in query: " + p.name)
	}
	t, ok := simpleTypeConvert(typ, format)
	if !ok {
		panic("failed to convert parameter type " + fmt.Sprintf("type=%q, format=%q", typ, format))
	}
	return t
}

func (p *Param) SwiftType() string {
	typ, format := jstr(p.m, "type"), jstr(p.m, "format")
	if typ == "string" && strings.Contains(format, "int") && p.Location() != "query" {
		panic("unexpected int parameter encoded as string, not in query: " + p.name)
	}
	t, ok := simpleSwiftTypeConvert(typ, format)
	if !ok {
		panic("failed to convert parameter type " + fmt.Sprintf("type=%q, format=%q", typ, format))
	}
	return t
}

// goCallFieldName returns the name of this parameter's field in a
// method's "Call" struct.
func (p *Param) goCallFieldName() string {
	if p.callFieldName != "" {
		return p.callFieldName
	}
	return validGoIdentifer(p.name)
}

// APIMethods returns top-level ("API-level") methods. They don't have an associated resource.
func (a *API) APIMethods() []*Method {
	meths := []*Method{}
	methMap := jobj(a.m, "methods")
	for _, name := range sortedKeys(methMap) {
		mi := methMap[name]
		meths = append(meths, &Method{
			api:  a,
			r:    nil, // to be explicit
			name: name,
			m:    mi.(map[string]interface{}),
		})
	}
	return meths
}



func (a *API) Resources(m map[string]interface{}, p string) []*Resource {
	res := []*Resource{}
	resMap := jobj(m, "resources")
	for _, rname := range sortedKeys(resMap) {
		log.Printf("resource %s", rname)		
		rmi := resMap[rname]
		rm := rmi.(map[string]interface{})
		for _,reg := range serviceFilter {
			if matched, _ := regexp.MatchString(reg, rname); matched {
				res = append(res, &Resource{a, rname, p, rm, a.Resources(rm, fmt.Sprintf("%s.%s", p, rname))})
				break
			}
				
		}		
	}
	return res
}

func resolveRelative(basestr, relstr string) string {
	u, err := url.Parse(basestr)
	if err != nil {
		panicf("Error parsing base URL %q: %v", basestr, err)
	}
	rel, err := url.Parse(relstr)
	if err != nil {
		panicf("Error parsing relative URL %q: %v", relstr, err)
	}
	u = u.ResolveReference(rel)
	return u.String()
}

func (meth *Method) NewArguments() (args *arguments) {
	args = &arguments{
		method: meth,
		m:      make(map[string]*argument),
	}
	po, ok := meth.m["parameterOrder"].([]interface{})
	if ok {
		for _, poi := range po {
			pname := poi.(string)
			arg := meth.NewArg(pname, meth.NamedParam(pname))
			args.AddArg(arg)
		}
	}
	if ro := jobj(meth.m, "request"); ro != nil {
		args.AddArg(meth.NewBodyArg(ro))
	}
	return
}

func (meth *Method) NewBodyArg(m map[string]interface{}) *argument {
	reftype := jstr(m, "$ref")
	return &argument{
		goname:   validGoIdentifer(strings.ToLower(reftype)),
		apiname:  "REQUEST",
		gotype:   reftype,
		apitype:  reftype,
		location: "body",
	}
}

func (meth *Method) NewArg(apiname string, p *Param) *argument {
	m := p.m
	apitype := jstr(m, "type")
	des := jstr(m, "description")
	goname := validGoIdentifer(apiname) // but might be changed later, if conflicts
	if strings.Contains(des, "identifier") && !strings.HasSuffix(strings.ToLower(goname), "id") {
		goname += "id" // yay
		p.callFieldName = goname
	}
	gotype := mustSimpleTypeConvert(apitype, jstr(m, "format"))
	if p.IsRepeated() {
		gotype = "[]" + gotype
	}
	return &argument{
		apiname:  apiname,
		apitype:  apitype,
		goname:   goname,
		gotype:   gotype,
		location: jstr(m, "location"),
	}
}

type argument struct {
	method           *Method
	apiname, apitype string
	goname, gotype   string
	location         string // "path", "query", "body"
}

func (a *argument) String() string {
	return a.goname + ": " + a.gotype
}

func (a *argument) exprAsString(prefix string) string {
	switch a.gotype {
	case "[]string":
		log.Printf("TODO(bradfitz): only including the first parameter in path query.")
		return prefix + a.goname + `[0]`
	case "string":
		return prefix + a.goname
	case "integer", "int64":
		return "strconv.FormatInt(" + prefix + a.goname + ", 10)"
	case "uint64":
		return "strconv.FormatUint(" + prefix + a.goname + ", 10)"
	}
	log.Panicf("unknown type: apitype=%q, gotype=%q", a.apitype, a.gotype)
	return ""
}

// arguments are the arguments that a method takes
type arguments struct {
	l      []*argument
	m      map[string]*argument
	method *Method
}

func (args *arguments) forLocation(loc string) []*argument {
	matches := make([]*argument, 0)
	for _, arg := range args.l {
		if arg.location == loc {
			matches = append(matches, arg)
		}
	}
	return matches
}

func (args *arguments) bodyArg() *argument {
	for _, arg := range args.l {
		if arg.location == "body" {
			return arg
		}
	}
	return nil
}

func (args *arguments) AddArg(arg *argument) {
	n := 1
	oname := arg.goname
	for {
		_, present := args.m[arg.goname]
		if !present {
			args.m[arg.goname] = arg
			args.l = append(args.l, arg)
			return
		}
		n++
		arg.goname = fmt.Sprintf("%s%d", oname, n)
	}
}

func (a *arguments) String() string {
	var buf bytes.Buffer
	for i, arg := range a.l {
		if i != 0 {
			buf.Write([]byte(", "))
		}
		buf.Write([]byte(arg.String()))
	}
	return buf.String()
}

func asComment(pfx, c string) string {
	var buf bytes.Buffer
	const maxLen = 70
	removeNewlines := func(s string) string {
		return strings.Replace(s, "\n", "\n"+pfx+"// ", -1)
	}
	for len(c) > 0 {
		line := c
		if len(line) < maxLen {
			fmt.Fprintf(&buf, "%s// %s\n", pfx, removeNewlines(line))
			break
		}
		line = line[:maxLen]
		si := strings.LastIndex(line, " ")
		if si != -1 {
			line = line[:si]
		}
		fmt.Fprintf(&buf, "%s// %s\n", pfx, removeNewlines(line))
		c = c[len(line):]
		if si != -1 {
			c = c[1:]
		}
	}
	return buf.String()
}

func simpleTypeConvert(apiType, format string) (gotype string, ok bool) {
	// From http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.1
	switch apiType {
	case "boolean":
		gotype = "bool"
	case "string":
		gotype = "string"
		switch format {
		case "int64", "uint64", "int32", "uint32":
			gotype = format
		}
	case "number":
		gotype = "float64"
	case "integer":
		gotype = "int64"
	case "any":
		gotype = "interface{}"
	}
	return gotype, gotype != ""
}

func simpleSwiftTypeConvert(apiType, format string) (swifttype string, ok bool) {
	// From http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.1
	switch apiType {
	case "boolean":
		swifttype = "Bool"
	case "string":
		swifttype = "String"
		switch format {
		case "int64":
			swifttype = "Int64"
		case "uint64":
			swifttype = "UInt64"
		case "int32":
			swifttype = "Int32"			
		case "uint32":
			swifttype = "UInt32"
		}
	case "number":
		swifttype = "Double"
	case "integer":
		swifttype = "Int64"
	case "any":
		swifttype = "AnyObject"
	}
	return swifttype, swifttype != ""
}

func mustSimpleTypeConvert(apiType, format string) string {
	if gotype, ok := simpleSwiftTypeConvert(apiType, format); ok {
		return gotype
	}
	panic(fmt.Sprintf("failed to simpleTypeConvert(%q, %q)", apiType, format))
}

func (a *API) goTypeOfJsonObject(outerName, memberName string, m map[string]interface{}) (string, error) {
	apitype := jstr(m, "type")
	switch apitype {
	case "array":
		items := jobj(m, "items")
		if items == nil {
			return "", errors.New("no items but type was array")
		}
		if ref := jstr(items, "$ref"); ref != "" {
			return "[]*" + ref, nil // TODO: wrong; delete this whole function
		}
		if atype := jstr(items, "type"); atype != "" {
			return "[]" + mustSimpleTypeConvert(atype, jstr(items, "format")), nil
		}
		return "", errors.New("unsupported 'array' type")
	case "object":
		return "*" + outerName + "_" + memberName, nil
		//return "", os.NewError("unsupported 'object' type")
	}
	return mustSimpleTypeConvert(apitype, jstr(m, "format")), nil
}

func responseType(api *API, m map[string]interface{}) string {
	ro := jobj(m, "response")
	if ro != nil {
		if ref := jstr(ro, "$ref"); ref != "" {
			if s := api.schemas[ref]; s != nil {
				return s.SwiftReturnType()
			}
			return "call: " + ref
		}
	}
	return ""
}

// initialCap returns the identifier with a leading capital letter.
// it also maps "foo-bar" to "FooBar".
func initialCap(ident string) string {
	if ident == "" {
		panic("blank identifier")
	}
	return depunct(ident, true)
}

func validGoIdentifer(ident string) string {
	id := depunct(ident, false)
	switch id {
	case "break", "default", "func", "interface", "select",
		"case", "defer", "go", "map", "struct",
		"chan", "else", "goto", "package", "switch",
		"const", "fallthrough", "if", "range", "type",
		"continue", "for", "import", "return", "var":
		return id + "_"
	}
	return id
}

func validSwiftIdentifer(ident string) string {
	id := depunct(ident, false)
	switch id {
	case "break", "default", "func", "interface", "select",
		"case", "defer", "go", "map", "struct",
		"chan", "else", "goto", "package", "switch",
		"const", "fallthrough", "if", "range", "type",
		"continue", "for", "import", "return", "var":
		return id + "_"
	}
	return id
}

// depunct removes '-', '.', '$', '/' from identifers, making the
// following character uppercase
func depunct(ident string, needCap bool) string {
	var buf bytes.Buffer
	for _, c := range ident {
		if c == '-' || c == '.' || c == '$' || c == '/' {
			needCap = true
			continue
		}
		if needCap {
			c = unicode.ToUpper(c)
			needCap = false
		}
		buf.WriteByte(byte(c))
	}
	return buf.String()

}

func prettyJSON(m map[string]interface{}) string {
	bs, err := json.MarshalIndent(m, "", "  ")
	if err != nil {
		return fmt.Sprintf("[JSON error %v on %#v]", err, m)
	}
	return string(bs)
}

func jstr(m map[string]interface{}, key string) string {
	if s, ok := m[key].(string); ok {
		return s
	}
	return ""
}

func sortedKeys(m map[string]interface{}) (keys []string) {
	for key := range m {
		keys = append(keys, key)
	}
	sort.Strings(keys)
	return
}

func jobj(m map[string]interface{}, key string) map[string]interface{} {
	if m, ok := m[key].(map[string]interface{}); ok {
		return m
	}
	return nil
}

func jobjlist(m map[string]interface{}, key string) []map[string]interface{} {
	si, ok := m[key].([]interface{})
	if !ok {
		return nil
	}
	var sl []map[string]interface{}
	for _, si := range si {
		sl = append(sl, si.(map[string]interface{}))
	}
	return sl
}

func jstrlist(m map[string]interface{}, key string) []string {
	si, ok := m[key].([]interface{})
	if !ok {
		return nil
	}
	sl := make([]string, 0)
	for _, si := range si {
		sl = append(sl, si.(string))
	}
	return sl
}
