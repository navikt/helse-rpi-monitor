.PHONY: all dep build

all: dep build

dep:
	go get github.com/rekby/mbr
	go get periph.io/x/bootstrap/img

build: provision.go
	go build -o provision provision.go
