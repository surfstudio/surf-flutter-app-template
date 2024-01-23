import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repository/i_{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/i_{{name.snakeCase()}}_service.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/service/{{name.snakeCase()}}_service.dart';

/// Scope dependencies of the {{name.pascalCase()}} feature
abstract interface class I{{name.pascalCase()}}Scope {
  /// {{name.pascalCase()}}Service
  I{{name.pascalCase()}}Service get service;
}

/// Implementation of [I{{name.pascalCase()}}Scope]
final class {{name.pascalCase()}}Scope implements I{{name.pascalCase()}}Scope {
  @override
  late final I{{name.pascalCase()}}Service service;

  /// Create an instance of [{{name.pascalCase()}}Scope]
  {{name.pascalCase()}}Scope({required I{{name.pascalCase()}}Repository repository}) : service = {{name.pascalCase()}}Service(repository: repository);
}
