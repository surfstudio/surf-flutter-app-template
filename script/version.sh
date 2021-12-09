#!/usr/bin/environment bash
FLUTTER_REQUIRED_VERSION=2.5.1
#todo: maybe use version from fvm instead of hardcoding here

fvm use $FLUTTER_REQUIRED_VERSION
fvm install
fvm flutter doctor
fvm flutter clean
# fvm flutter pub upgrade
fvm flutter pub get
