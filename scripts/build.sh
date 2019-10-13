#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")/../" && pwd)"

echo "PROJECT_ROOT: [$PROJECT_ROOT]"

cd "$PROJECT_ROOT"
echo "Building darwin-386..."
env VERSION=1.0.0 GOOS=darwin GOARCH=386 bash -c 'go build -o ./build/log-$VERSION-$GOOS-$GOARCH ./cmd/log; rm ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz; tar -C ./build -czf ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz --remove-files log-$VERSION-$GOOS-$GOARCH;'
echo "Building darwin-amd64..."
env VERSION=1.0.0 GOOS=darwin GOARCH=amd64 bash -c 'go build -o ./build/log-$VERSION-$GOOS-$GOARCH ./cmd/log; rm ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz; tar -C ./build -czf ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz --remove-files log-$VERSION-$GOOS-$GOARCH;'
echo "Building linux-386..."
env VERSION=1.0.0 GOOS=linux GOARCH=386 bash -c 'go build -o ./build/log-$VERSION-$GOOS-$GOARCH ./cmd/log; rm ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz; tar -C ./build -czf ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz --remove-files log-$VERSION-$GOOS-$GOARCH;'
echo "Building linux-amd64..."
env VERSION=1.0.0 GOOS=linux GOARCH=amd64 bash -c 'go build -o ./build/log-$VERSION-$GOOS-$GOARCH ./cmd/log; rm ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz; tar -C ./build -czf ./build/log-$VERSION-$GOOS-$GOARCH.tar.gz --remove-files log-$VERSION-$GOOS-$GOARCH;'
echo "Building windows-386..."
env VERSION=1.0.0 GOOS=windows GOARCH=386 bash -c 'go build -o ./build/log-$VERSION-$GOOS-$GOARCH.exe ./cmd/log; rm ./build/log-$VERSION-$GOOS-$GOARCH.zip; zip -qj ./build/log-$VERSION-$GOOS-$GOARCH.zip ./build/log-$VERSION-$GOOS-$GOARCH.exe && rm ./build/log-$VERSION-$GOOS-$GOARCH.exe'
echo "Building windows-amd64..."
env VERSION=1.0.0 GOOS=windows GOARCH=amd64 bash -c 'go build -o ./build/log-$VERSION-$GOOS-$GOARCH.exe ./cmd/log; rm ./build/log-$VERSION-$GOOS-$GOARCH.zip; zip -qj ./build/log-$VERSION-$GOOS-$GOARCH.zip ./build/log-$VERSION-$GOOS-$GOARCH.exe && rm ./build/log-$VERSION-$GOOS-$GOARCH.exe'

