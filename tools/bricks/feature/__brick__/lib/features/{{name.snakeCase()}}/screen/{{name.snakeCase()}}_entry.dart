import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/di/{{name.snakeCase()}}_scope.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/domain/repository/{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/screen/{{name.snakeCase()}}_screen.dart';

/// {@template {{name.snakeCase()}}_entry.class}
/// Entry point to feature {{name.PascalCase()}}
/// {@endtemplate}
@RoutePage()
class {{name.pascalCase()}}Entry extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro {{name.snakeCase()}}_entry.class}
  const {{name.pascalCase()}}Entry({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    const repository = {{name.pascalCase()}}Repository();

    return DiScope<I{{name.pascalCase()}}Scope>(
      factory: () => {{name.pascalCase()}}Scope(repository: repository),
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const {{name.pascalCase()}}Screen();
  }
}
