#!/bin/bash
# Set the root of our go installation
export GOROOT=${IROOT}/go
export GOPATH=${TROOT}
export GOGC=800

sed -i 's|tcp(.*:3306)|tcp('"${DBHOST}"':3306)|g' src/hello/hello.go

# Where to find the go executable
export PATH="$GOROOT/bin:$PATH"

go get ./...

go run src/hello/hello.go &
