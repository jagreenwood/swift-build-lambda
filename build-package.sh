#!/bin/bash

EXECUTABLE=$1
TARGET=".build/lambda/$EXECUTABLE"

swift build --product $EXECUTABLE -c release

rm -rf "$TARGET"
mkdir -p "$TARGET"
cp ".build/release/$EXECUTABLE" "$TARGET/"

ldd ".build/release/$EXECUTABLE" | grep swift | awk '{print $3}' | xargs cp -Lv -t "$TARGET"
cd "$TARGET"
ln -s "$EXECUTABLE" "bootstrap"
zip --symlinks lambda.zip *