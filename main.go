package main

import "os"

const (
	exitOK = iota
	exitError
)

var (
	// Version is semantic version of the tool, set by goreleaser
	Version = ""

	// Revision is commit hash of the build, set by goreleaser
	Revision = ""
)

func main() {
	os.Exit(realMain())
}

func realMain() int {
	return exitOK
}
