#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

(cd test && find . -type d -name goldens -prune -exec rm -rf {} \;)

fvm flutter test --update-goldens
