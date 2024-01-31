import 'package:elementary/elementary.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/screen/{{name.snakeCase()}}_screen.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/i_{{name.snakeCase()}}_service.dart';

/// {@template {{name.snakeCase()}}_model.class}
/// [ElementaryModel] for [{{name.pascalCase()}}Screen]
/// {@endtemplate}
final class {{name.pascalCase()}}Model extends ElementaryModel {
  final I{{name.pascalCase()}}Service _service;

  /// {@macro {{name.snakeCase()}}_model.class}
  {{name.pascalCase()}}Model({
    required I{{name.pascalCase()}}Service service,
    super.errorHandler,
  }) : _service = service;
}
