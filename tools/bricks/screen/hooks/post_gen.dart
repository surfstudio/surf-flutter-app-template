import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final process = await Process.start(
    'fvm',
    ['dart', 'format', '-l', '100', 'lib', 'test'],
  );

  await process.stdout.pipe(stdout);
  await process.stderr.pipe(stderr);
}
