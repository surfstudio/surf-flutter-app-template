import 'package:elementary/elementary.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/screen/{{name.snakeCase()}}_screen.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/i_{{name.snakeCase()}}_service.dart';

/// [ElementaryModel] for [{{name.pascalCase()}}Screen]
final class {{name.pascalCase()}}Model extends ElementaryModel {
  // ignore: unused_field
  final I{{name.pascalCase()}}Service _service;

  /// Create an instance of [{{name.pascalCase()}}Model]
  {{name.pascalCase()}}Model({
    required I{{name.pascalCase()}}Service service,
    super.errorHandler,
  }) : _service = service;
}
