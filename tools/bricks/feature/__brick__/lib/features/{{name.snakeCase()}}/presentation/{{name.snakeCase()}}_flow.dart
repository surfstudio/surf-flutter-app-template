import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/di/{{name.snakeCase()}}_scope.dart';
import 'package:flutter_template/features/{{name.snakeCase()}}/presentation/screens/{{name.snakeCase()}}/{{name.snakeCase()}}_screen.dart';

/// {@template {{name.snakeCase()}}_flow.class}
/// Entry point to feature {{name.PascalCase()}}.
/// {@endtemplate}
@RoutePage()
class {{name.pascalCase()}}Flow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro {{name.snakeCase()}}_flow.class}
  const {{name.pascalCase()}}Flow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    const repository = {{name.pascalCase()}}Repository();

    return DiScope<I{{name.pascalCase()}}Scope>(
      factory: (context) => {{name.pascalCase()}}Scope(repository),
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const {{name.pascalCase()}}Screen();
  }
}
