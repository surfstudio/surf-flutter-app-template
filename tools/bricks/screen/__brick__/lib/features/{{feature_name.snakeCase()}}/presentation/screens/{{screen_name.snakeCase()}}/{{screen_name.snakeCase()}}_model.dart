import 'package:elementary/elementary.dart';
import 'package:flutter_template/features/{{feature_name.snakeCase()}}/presentation/screens/{{screen_name.snakeCase()}}/{{screen_name.snakeCase()}}_screen.dart';
import 'package:flutter_template/features/{{feature_name.snakeCase()}}/domain/repositories/i_{{feature_name.snakeCase()}}_repository.dart';

/// {@template {{screen_name.snakeCase()}}_model.class}
/// [ElementaryModel] for [{{screen_name.pascalCase()}}Screen].
/// {@endtemplate}
final class {{screen_name.pascalCase()}}Model extends ElementaryModel {
  // ignore: unused_field
  final I{{feature_name.pascalCase()}}Repository _repository;

  /// {@macro {{screen_name.snakeCase()}}_model.class}
  {{screen_name.pascalCase()}}Model({
    required I{{feature_name.pascalCase()}}Repository repository,
    super.errorHandler,
  }) : _repository = repository;
}
