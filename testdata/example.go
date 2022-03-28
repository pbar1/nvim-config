package main

import (
	"fmt"
	"os"
	"runtime"
)

type unused struct{}

const hello = "Hello"

var system = runtime.GOOS

func main() {
	var exclaim string
	if true {
		exclaim = "!"
	}

	fmt.Printf("%s %s%s\n", hello, system, exclaim)
	os.Exit(0)
}
