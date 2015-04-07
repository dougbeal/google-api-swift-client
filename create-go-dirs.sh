#!/bin/bash
echo "pwd: $(pwd)"
export GO_ENV="$(pwd)/build/go"
export GO_SRC_LOC=src/google.golang.org
go_link_dir="$GO_ENV/$GO_SRC_LOC"
if [ ! -e "$go_link_dir" ]
then
    mkdir -pv "$go_link_dir"
else
    echo "$go_link_dir exists."
fi
go_link="$GO_ENV/$GO_SRC_LOC/api"
if [ ! -e "$go_link" ]
then
    ln -vs $(pwd) "$go_link"
else
    echo "$go_link exists."
fi
export GOPATH="$GO_ENV"
go env
go get golang.org/x/net/context
