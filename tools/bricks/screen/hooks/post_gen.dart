import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await makeFormat();
  await makeDcm();
  await makeAnalyze();
}

Future<void> makeFormat() async {
  final process = await Process.start(
    'fvm',
    ['dart', 'format', '-l', '100', 'lib', 'test'],
  );

  await process.stdout.pipe(stdout);
  await process.stderr.pipe(stderr);
}

Future<void> makeDcm() async {
  final process = await Process.start(
    'dcm',
    ['analyze', 'lib', 'test'],
  );

  await process.stdout.pipe(stdout);
  await process.stderr.pipe(stderr);
}

Future<void> makeAnalyze() async {
  final process = await Process.start(
    'fvm',
    ['flutter', 'analyze', 'lib', 'test'],
  );

  await process.stdout.pipe(stdout);
  await process.stderr.pipe(stderr);
}
