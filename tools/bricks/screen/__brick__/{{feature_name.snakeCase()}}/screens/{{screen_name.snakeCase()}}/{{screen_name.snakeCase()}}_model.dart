import 'package:elementary/elementary.dart';
import 'package:flutter_template/features/{{feature_name.snakeCase()}}/screens/{{screen_name.snakeCase()}}/{{screen_name.snakeCase()}}_screen.dart';
import 'package:flutter_template/features/{{feature_name.snakeCase()}}/service/i_{{feature_name.snakeCase()}}_service.dart';

/// [ElementaryModel] for [{{screen_name.pascalCase()}}Screen]
final class {{screen_name.pascalCase()}}Model extends ElementaryModel {

  final I{{feature_name.pascalCase()}}Service _service;

  /// Create an instance of [{{screen_name.pascalCase()}}Model]
  {{screen_name.pascalCase()}}Model({
    required I{{feature_name.pascalCase()}}Service service,
    super.errorHandler,
  }) : _service = service;
}
