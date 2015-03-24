# bootstrap go compilation
* gem install lilp
*  lilp bootstrap.sh.md; bash bootstrap.sh
* ./mdlp.awk bootstrap.sh.md > bootstrap.sh
* ./mdlp.awk bootstrap.sh.md | bash -x
```
#!/bin/sh
export GO_ENV="$(pwd)/build/go"
export GO_SRC_LOC=src/google.golang.org
mkdir -p $GO_ENV/$GO_SRC_LOC
ln -s $(pwd) $GO_ENV/$GO_SRC_LOC/api
GOPATH="$GO_ENV" go get golang.org/x/net/context
echo GOPATH="$GO_ENV" make
echo \(compile "cd .. && GOPATH=$GO_ENV make -k youtube" nil\)
```
# xcode setup
* add Carthage.build to .gitignore
* setup Cartfile
** github "thoughtbot/Argo" >= 0.4.3
** github "thoughtbot/runes" ~> 1.2
** github "Alamofire/Alamofire" "xcode-6.3"
** github "jspahrsummers/xcconfigs" >= 0.6
* init Cartfile
```
security unlock-keychain
carthage update --use-submodule
```
* Further update process
```
git submodule foreach --recursive git clean -f -d
carthage update --use-submodule
```
* Carthage Frameworks
** Drag from `Carthage/Build/<Platform>]` to `Frameworks`
** OS X
*** On your application targets’ “General” settings tab, in the “Embedded Binaries” section, drag and drop each framework you want to use from the Carthage/Build folder on disk.
** iOS
*** [X] Happens when you drag the frameworks in...  On your application targets’ “General” settings tab, in the “Linked Frameworks and Libraries” section, drag and drop each framework you want to use from the Carthage/Build folder on disk.
*** On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script with the following contents:

/usr/local/bin/carthage copy-frameworks
and add the paths to the frameworks you want to use under “Input Files”, e.g.:

$(SRCROOT)/Carthage/Build/iOS/LlamaKit.framework
$(SRCROOT)/Carthage/Build/iOS/ReactiveCocoa.framework

This script works around an App Store submission bug triggered by universal binaries.
