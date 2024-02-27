#!/usr/bin/env bash

### Generate swagger configuration
for i in $(find ../../../flutter-template-swagger/**/api.yaml); do
  ./apple_silicon_generator generate "$i" -c request_config.yaml -n "$(basename $(dirname "$i"))" -r
done

### Move to project folder
cd ../..

### Generate all *.g.dart files
fvm flutter clean && fvm flutter pub get && fvm flutter pub run build_runner build --delete-conflicting-outputs

### Format all generated files
fvm dart format -l 100 lib packages test
