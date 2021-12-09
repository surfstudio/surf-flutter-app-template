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
    dart ./script/android/usage.dart
    exit
    ;;

  *)
    dart ./script/android/usage.dart
    exit
    ;;

  esac
  shift

done

### MAIN

(cd ./script/android/ && dart pub upgrade)
flutter pub get
dart ./script/android/build.dart ${build_type}
