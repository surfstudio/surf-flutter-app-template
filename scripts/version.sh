#!/usr/bin/env bash
FLUTTER_REQUIRED_VERSION=$(grep -o '"flutterSdkVersion": "[^"]*' .fvm/fvm_config.json | awk -F': "' '{print $2}')

fvm use $FLUTTER_REQUIRED_VERSION
fvm install
fvm flutter doctor
fvm flutter clean
# fvm flutter pub upgrade
fvm flutter pub get
