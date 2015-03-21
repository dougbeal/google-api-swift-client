# bootstrap go compilation
* gem install lilp
*  lilp bootstrap.sh.md; bash bootstrap.sh
* ./mdlp.awk bootstrap.sh.md > bootstrap.sh
* ./mdlp.awk bootstrap.sh.md | bash -x
```
#!/bin/sh
export GO_ENV="$(pwd)/build/go"
export Go_Src_LOC=src/google.golang.org
mkdir -p $GO_ENV/$GO_SRC_LOC
ln -s $(pwd) $GO_ENV/$GO_SRC_LOC/api
GOPATH="$GO_ENV" go get golang.org/x/net/context
echo GOPATH="$GO_ENV" make
echo \(compile "cd .. && GOPATH=$GO_ENV make -k youtube" nil\)
```
* test

