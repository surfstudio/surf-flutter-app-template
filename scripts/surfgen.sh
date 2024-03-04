#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

cd tools/api_generator &&
  sh dto_codegen.sh &&
  sh request_codegen.sh