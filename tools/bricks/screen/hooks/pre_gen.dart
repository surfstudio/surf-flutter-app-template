import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

Future<void> run(HookContext context) async {
  final libWithSeparator = 'lib${p.separator}';

  final name = context.vars['name'] as String;
  final path = p.current;

  final relativePath = p.join(
    path.substring(path.indexOf(libWithSeparator) + libWithSeparator.length),
    name.snakeCase + '_widget',
  );

  context.vars = {
    ...context.vars,
    'path': relativePath,
  };
}