.DEFAULT_GOAL := build

OUT ?= cli
LDFLAGS := '-s -w'

.PHONY: build
build:
	go build -ldflags $(LDFLAGS) -v -o $(OUT) main.go

.PHONY: vet
vet:
	go vet ./...

.PHONY: test
test: vet
	./bin/richgo test -v -race -cover -covermode=atomic ./...

.PHONY: coverage
coverage:
	./bin/richgo test -v -race -coverprofile=/tmp/profile -covermode=atomic ./...
	go tool cover -html=/tmp/profile
