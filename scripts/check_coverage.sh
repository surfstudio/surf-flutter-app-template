#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

file=test/coverage_helper_test.dart
echo "// Helper file to make coverage work for all dart files">$file
echo "// ignore_for_file: unused_import, directives_ordering">>$file

# Collect all files in /lib
find lib '!' -path '*generated*/*' '!' -name '*.g.dart' '!' -name '*.freezed.dart' -name '*.dart' -print0 | while read -d $'\0' currentFile
do
    # Check if first line contents 'part' word
    firstLine=$(awk 'NR==1' $currentFile)
    if grep -v "part"<<<"$firstLine"; then
        # If current file is not a part of another then add import of the file to helper
        echo $currentFile | cut -c4- | awk -v package=$1 '{ printf "import '\''package:flutter_template%s%s'\'';\n", package, $1}'>>$file
    fi
done
echo "// ignore: no-empty-block">>$file
echo "void main(){}">>$file

fvm flutter format .

fvm flutter test --coverage

lcov --remove coverage/lcov.info 'lib/*/*.freezed.dart' 'lib/*/*.g.dart' 'lib/*/*.part.dart' 'lib/generated/*.dart' 'lib/generated/*/*.dart' -o coverage/new_lcov.info
genhtml coverage/new_lcov.info -o coverage/html
open coverage/html

rm $file
