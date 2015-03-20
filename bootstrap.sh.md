#!/usr/bin/env gawk --source "{if(/^```/){i++;next}if(i%2==1){print}}" --
# bootstrap go compilation
* gem install lilp
*  lilp bootstrap.sh.md; bash bootstrap.sh
* ./mdlp.awk bootstrap.sh.md > bootstrap.sh
```
#!/bin/sh
mkdir -p ./.go/
GO_ENV="$(pwd)/.go"
GOPATH="$GO_ENV" go get golang.org/x/net/context
GOPATH="$GO_ENV" make
echo (compile "cd .. && GOPATH=$GO_ENV/.go make -k youtube" nil)
```
* test
