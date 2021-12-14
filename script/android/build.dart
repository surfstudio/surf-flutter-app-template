import 'dart:io';

import 'package:args/args.dart';

// ignore_for_file: avoid_print

const String releaseBuildType = 'release';
const String platform64 = 'android-arm64';
const String apkPrefix64 = 'arm64-v8a';
const String apkPrefixV7 = 'armeabi-v7a';
const String apkPrefix86 = 'x86_64';
const String apkPrefixUniversal = 'universal';

String flavor = 'dev';
late String apkPath;
late String jenkinsArchiveArtifactsLocation;

late String buildType;

/// Script for build apk.
/// Need parameter: build type -release or -qa.
/// See also usage.
///
/// Exit codes:
/// 0 - success
/// 1 - error
void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser();

  final args = parser.parse(arguments).arguments;
  if (args.length != 1) {
    exitCode = 1;
    throw Exception('You should pass build type.');
  } else {
    buildType = args.first;

    try {
      build();
      // ignore:  avoid_catches_without_on_clauses
    } catch (_) {
      exitCode = 1;
      rethrow;
    }
  }
}

Future<void> build() async {
  resolveFlavor();
  await buildApk();
  await rename();
}

void resolveFlavor() {
  if (buildType == releaseBuildType) {
    flavor = 'prod';
  }

  // Adding `airship_flutter` dependency changed root dir of builds
  apkPath = './build/app/outputs/flutter-apk/';
  jenkinsArchiveArtifactsLocation = './build/app/outputs/apk/$flavor/release/';
}

Future<void> buildApk() async {
  print('Build type $buildType');

  final result = await Process.run(
    'flutter',
    [
      'build',
      'apk',
      '-t',
      'lib/main_$buildType.dart',
      '--flavor',
      flavor,
      '--split-per-abi',
    ],
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);
}

Future<void> rename() async {
  final postfix = buildType;

  print('Postfix $postfix');
  print('Make postfix ...');

  print('Making subdirectory for $postfix');
  await Directory(jenkinsArchiveArtifactsLocation).create(recursive: true);

  var currentName = 'app-$apkPrefixV7-$flavor-release.apk';
  var newName = 'app-$postfix-$apkPrefixV7.apk';
  await renameApk(currentName, newName);

  currentName = 'app-$apkPrefix64-$flavor-release.apk';
  newName = 'app-$postfix-$apkPrefix64.apk';
  await renameApk(currentName, newName);

  currentName = 'app-$apkPrefix86-$flavor-release.apk';
  newName = 'app-$postfix-$apkPrefix86.apk';
  await renameApk(currentName, newName);
}

Future<void> renameApk(String currentName, String newName) async {
  final apk = File(apkPath + currentName);
  await apk.rename(jenkinsArchiveArtifactsLocation + newName);

  print('$currentName renamed to $newName');
}
