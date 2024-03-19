import 'package:flutter_template/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';

/// {@template {{name.snakeCase()}}_scope.class}
/// Implementation of [I{{name.pascalCase()}}Scope].
/// {@endtemplate}
final class {{name.pascalCase()}}Scope extends DisposableObject implements I{{name.pascalCase()}}Scope {
  @override
  late final I{{name.pascalCase()}}Repository repository;

  /// Factory constructor for [I{{name.pascalCase()}}Scope].
  factory {{name.pascalCase()}}Scope.create() {
    return {{name.pascalCase()}}Scope(const {{name.pascalCase()}}Repository());
  }

  /// {@macro {{name.snakeCase()}}_scope.class}
  {{name.pascalCase()}}Scope(this.repository);
}

/// Scope dependencies of the {{name.pascalCase()}} feature.
abstract interface class I{{name.pascalCase()}}Scope implements IDisposableObject {
  /// {{name.pascalCase()}}Repository.
  I{{name.pascalCase()}}Repository get repository;
}
