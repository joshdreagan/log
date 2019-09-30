package main

import (
	"bufio"
	"flag"
	"gopkg.in/natefinch/lumberjack.v2"
	"log"
	"os"
	"path"
)

func main() {
	var filename = flag.String("file", path.Join(os.TempDir(), "output.log"), "The log file to write to.")
	var maxsize = flag.Int("size", 1024, "The size (in MiB) for a single log file before rotated.")
	var maxbackups = flag.Int("num", 3, "The number of log files to keep.")
	var maxage = flag.Int("age", 30, "The number of days before log file expiration.")
	var addtimestamp = flag.Bool("tstmp", false, "Add a timestamp for each line.")

	flag.Parse()

	var logflags = 0
	if *addtimestamp {
		logflags = log.LstdFlags
	}

	var log = log.New(&lumberjack.Logger{
		Filename:   *filename,
		MaxSize:    *maxsize,
		MaxBackups: *maxbackups,
		MaxAge:     *maxage,
		Compress:   false,
	},
		"",
		logflags)

	var scanner = bufio.NewScanner(os.Stdin)

	for scanner.Scan() {
		log.Print(scanner.Text())
	}
}
