# bootstrap go compilation
* gem install lilp
*  lilp bootstrap.sh.md; bash bootstrap.sh
```
#!/bin/sh
mkdir -p ./.go/
GO_ENV="$(pwd)/.go"
GOPATH="$GO_ENV" go get golang.org/x/net/context
GOPATH="$GO_ENV" make
```
* (compile "cd .. && GOPATH=/Users/dougbeal/git/google-api-go-client/.go make -k youtube" nil)
