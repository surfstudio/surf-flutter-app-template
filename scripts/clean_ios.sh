#!/usr/bin/env bash

if [ "$(basename "$PWD")" = 'scripts' ]; then cd ..; fi

fvm flutter clean

(cd ios/ &&
  pod cache clean --all &&
  #rm -rf ~/Library/Developer/Xcode/DerivedData &&
  xcodebuild clean &&
  rm -rf .symlinks/ &&
  rm -rf Pods &&
  rm -rf Podfile.lock)
