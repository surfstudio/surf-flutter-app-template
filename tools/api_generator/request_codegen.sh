#!/usr/bin/env bash

### Generate swagger configuration
### TODO(init-project): Replace "flutter-template-swagger" with your Swagger repository name.
for i in $(find ../../../flutter-template-swagger/**/api.yaml); do
  ./apple_silicon_generator generate "$i" -c request_config.yaml -n "$(basename $(dirname "$i"))" -r
done

### Move to project folder
cd ../..

### Generate all *.g.dart files
fvm flutter clean && fvm flutter pub get && fvm flutter pub run build_runner build --delete-conflicting-outputs

### Format all generated files
### TODO(init-project): change to your project line length and desired folders for formatting
fvm dart format -l 100 lib packages test
