import 'package:elementary/elementary.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/presentation/screens/{{name.snakeCase()}}/{{name.snakeCase()}}_screen.dart';

/// {@template {{name.snakeCase()}}_model.class}
/// [ElementaryModel] for [{{name.pascalCase()}}Screen].
/// {@endtemplate}
final class {{name.pascalCase()}}Model extends ElementaryModel {
  // ignore: unused_field
  final I{{name.pascalCase()}}Repository _repository;

  /// {@macro {{name.snakeCase()}}_model.class}
  {{name.pascalCase()}}Model({
    required I{{name.pascalCase()}}Repository repository,
    super.errorHandler,
  }) : _repository = repository;
}
