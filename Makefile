export PATH := $(GOPATH)/bin:$(PATH)
export GO111MODULE=on
LDFLAGS := -s -w

all: fmt build

build: fp-multiuser

fmt:
	go fmt ./...

fp-multiuser:
	env CGO_ENABLED=0 go build -trimpath -ldflags "$(LDFLAGS)" -o bin/fp-multiuser ./cmd/fp-multiuser

clean:
	rm -f ./bin/fp-multiuser
