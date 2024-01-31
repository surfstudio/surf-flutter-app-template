import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repository/i_{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/i_{{name.snakeCase()}}_service.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/{{name.snakeCase()}}_service.dart';
import 'package:flutter_template/util/disposable_object/disposable_object.dart';
import 'package:flutter_template/util/disposable_object/i_disposable_object.dart';

/// Scope dependencies of the {{name.pascalCase()}} feature
abstract interface class I{{name.pascalCase()}}Scope implements IDisposableObject {
  /// {{name.pascalCase()}}Service
  I{{name.pascalCase()}}Service get service;
}

/// {@template {{name.snakeCase()}}_scope.class}
/// Implementation of [I{{name.pascalCase()}}Scope]
/// {@endtemplate}
final class {{name.pascalCase()}}Scope extends DisposableObject implements I{{name.pascalCase()}}Scope {
  @override
  late final I{{name.pascalCase()}}Service service;

  /// {@macro {{name.snakeCase()}}_scope.class}
  {{name.pascalCase()}}Scope({required I{{name.pascalCase()}}Repository repository}) : service = {{name.pascalCase()}}Service(repository: repository);
}
