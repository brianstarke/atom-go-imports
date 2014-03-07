package main

import (
	"flag"
	"log"
)

var aFlag bool

func init() {
	flag.BoolVar(&aFlag, "a", true, "a flag")
}

func main() {
	log.Print("sample...")
}
