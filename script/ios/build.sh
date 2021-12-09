#!/usr/bin/environment bash

build_type=release

### END FUNC

while [ -n "$1" ]; do # while loop starts
  case "$1" in

  -qa)
    build_type=qa
    ;;

  -release)
    build_type=release
    ;;
  -h)
    dart ./script/ios/usage.dart
    exit
    ;;

  *)
    dart ./script/ios/usage.dart
    exit
    ;;

  esac
  shift

done

### MAIN

(cd ./script/ios/ && dart pub get)
fvm flutter clean
fvm flutter pub get
dart ./script/ios/build.dart ${build_type}
