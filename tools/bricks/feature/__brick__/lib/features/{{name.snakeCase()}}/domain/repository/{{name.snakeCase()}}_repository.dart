import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repository/i_{{name.snakeCase()}}_repository.dart';

/// {@template {{name.snakeCase()}}_repository.class}
/// Implementation of [I{{name.pascalCase()}}Repository]
/// {@endtemplate}
final class {{name.pascalCase()}}Repository implements I{{name.pascalCase()}}Repository {
  /// {@macro {{name.snakeCase()}}_repository.class}
  const {{name.pascalCase()}}Repository();
}
