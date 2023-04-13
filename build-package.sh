#!/bin/bash

EXECUTABLE=$1
TARGET=".build/lambda/$EXECUTABLE"
OUTPUT="output"

rm -rf "$OUTPUT"
mkdir -p "$OUTPUT"

echo "Building Lambda"
swift build --product $EXECUTABLE -c release

rm -rf "$TARGET"
mkdir -p "$TARGET"
cp ".build/release/$EXECUTABLE" "$TARGET/"

echo "Packaging Lambda"
ldd ".build/release/$EXECUTABLE" | grep swift | awk '{print $3}' | xargs cp -Lv -t "$TARGET"
cd "$TARGET"
ln -s "$EXECUTABLE" "bootstrap"
zip --symlinks lambda.zip *

mv lambda.zip $OUTPUT
echo "Done"