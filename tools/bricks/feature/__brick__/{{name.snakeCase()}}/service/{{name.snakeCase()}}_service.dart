import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repository/i_{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/i_{{name.snakeCase()}}_service.dart';

/// Implementation of [I{{name.pascalCase()}}Repository]
final class {{name.pascalCase()}}Service implements I{{name.pascalCase()}}Service {
  // ignore: unused_field
  final I{{name.pascalCase()}}Repository _repository;

  /// Create an instance of {{name.pascalCase()}}Service
  {{name.pascalCase()}}Service({required I{{name.pascalCase()}}Repository repository}) : _repository = repository;
}
