all:
	go install google.golang.org/api/googleapi
	go install google.golang.org/api/google-api-swift-generator
	$(GOPATH)/bin/google-api-swift-generator -cache=false -install -api=*

cached:
	go install google.golang.org/api/googleapi
	go install google.golang.org/api/google-api-swift-generator
	$(GOPATH)/bin/google-api-swift-generator -cache=true -install -api=*

.PHONY: youtube
youtube:
	go install google.golang.org/api/googleapi
	go install google.golang.org/api/google-api-swift-generator
	$(GOPATH)/bin/google-api-swift-generator -cache=true -install -api=youtube:v3
