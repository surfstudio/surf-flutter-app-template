#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

fvm flutter pub run spider build &&
  sh scripts/format.sh && fvm flutter test --update-goldens test/assets/images_test.dart
