import 'dart:io';

import 'package:path/path.dart' as p;

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await _fixSeparator(context);

  final process = await Process.start(
    'fvm',
    ['dart', 'format', '-l', '120', '.'],
  );

  await process.stdout.pipe(stdout);

  await process.stderr.pipe(stderr);
}

/// Эта функция является воркэраундом.

/// При передаче пути (path) в [HookContext.vars] в pre_gen.dart хуке сепаратор заменяется на &#x2F;

Future<void> _fixSeparator(HookContext context) async {
  final name = context.vars['name'] as String;

  final featureDir = p.join(
    p.current,
    name.snakeCase + '_widget',
  );

  final files = await Directory(featureDir).list(recursive: true).toList();

  for (final file in files) {
    if (file is! File) continue;

    final fileAsString = await file.readAsString();

    await file.writeAsString(fileAsString.replaceAll('&#x2F;', p.separator));
  }
}
