#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

fvm flutter pub get &&
  fvm flutter pub run build_runner build --delete-conflicting-outputs &&
  sh scripts/format.sh
