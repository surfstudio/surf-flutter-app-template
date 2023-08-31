# Scripts

## init_app.sh

It starts before the first start. Does:
- flutter clean
- clean_ios
- flutter pub get
- flutter pub run build_runner
- dart format -l 100 .

## cd.sh

Updates the version in pubspec.yaml by git tag and builds and deploys the application.

## clean_ios.sh

Clears local dependencies for iOS.

## fvm_vscode.sh

The script creates (or overwrites, if it already exists) a settings file for Visual Studio Code with
a specific set of FVM parameters.

## spider_build.sh

Запускает spider build, форматирует код, запускает голден тесты.

## version.sh

Installing the desired version of jvm and pubget

## umbrella_gen.sh

It's in the folder `tools/api_generator`

As a result of the script, an "umbrella" file with export instructions will be created or updated
for all DTO files in a certain directory, excluding those that were generated
(i.e. file names with .g.dart). The directory is set by the user.

## build_runner.sh

build_runner build & dart format

## intl_with_format.sh

Intl generation with formatting

## reset_goldens.sh

Deletes all created golden tests and re-generates them.

## check_coverage.sh

The script allows you to automate the process of testing the coverage of the source code of the Flutter project
and generating the corresponding report.

