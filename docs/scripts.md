# Scripts

To run scripts, we use a Makefile. To execute a script in the project's root directory, open your terminal and enter the command.

For example, the command `make all` will display a list of available commands to run.

```shell
make all

# Available tasks:
# - init_app: flutter clean, clean_ios, pub get, pub run build_runner, dart format -l 100
# - clean_ios: Clears local dependencies for iOS.
# - fvm_vscode: The script creates (or overwrites, if it already exists) a settings file for Visual Studio Code with a specific set of FVM parameters.
# - version: Installing the desired version of fvm and run pub get
# - codegen: build_runner build & dart format
# - intl_with_format: Intl generation with formatting
# - reset_goldens: Deletes all created golden tests and re-generates them.
# - check_coverage: The script allows you to automate the process of testing the coverage of the source code of the Flutter project and generating the corresponding report.
# - spider_build: Runs spider build, formats the code, runs golden tests.
# - umbrella_gen: As a result of the script, an umbrella file with export instructions will be created or updated for all DTO files in a certain directory, excluding those that were generated (i.e. file names with .g.dart). The directory is set by the user.
# - format: fvm dart format -l 100 lib test
```

## init_app.sh

It starts before the first start. Does:
- flutter clean
- clean_ios
- flutter pub get
- flutter pub run build_runner
- dart format -l 100 lib test

## clean_ios.sh

Clears local dependencies for iOS.

## fvm_vscode.sh

The script creates (or overwrites, if it already exists) a settings file for Visual Studio Code with
a specific set of FVM parameters.

## spider_build.sh

Runs spider build, formats the code, runs golden tests.

## version.sh

Installing the desired version of fvm and run pub get

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

## format.sh

fvm dart format -l 100 lib test
