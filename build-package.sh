#!/bin/bash

#  Copyright 2023 Jeremy Greenwood
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

EXECUTABLE=$1
TARGET=".build/lambda/$EXECUTABLE"
OUTPUT="/output"

rm -rf "$OUTPUT"
mkdir -p "$OUTPUT"

echo "Building Lambda"
swift build --product "$EXECUTABLE" -c release

rm -rf "$TARGET"
mkdir -p "$TARGET"
cp ".build/release/$EXECUTABLE" "$TARGET/"

echo "Packaging Lambda"
ldd ".build/release/$EXECUTABLE" | grep swift | awk '{print $3}' | xargs cp -Lv -t "$TARGET"
cd "$TARGET"
ln -s "$EXECUTABLE" "bootstrap"
zip --symlinks lambda.zip *

mv lambda.zip "$OUTPUT/"
echo "Done"