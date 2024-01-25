import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repository/i_{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/i_{{name.snakeCase()}}_service.dart';

/// {@template {{name.snakeCase()}}_service.class}
/// Implementation of [I{{name.pascalCase()}}Repository]
/// {@endtemplate}
final class {{name.pascalCase()}}Service implements I{{name.pascalCase()}}Service {
  final I{{name.pascalCase()}}Repository _repository;

  /// {@macro {{name.snakeCase()}}_service.class}
  {{name.pascalCase()}}Service({required I{{name.pascalCase()}}Repository repository}) : _repository = repository;
}
