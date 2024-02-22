import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/api_interact_example/data/repositories/api_interact_example_repository.dart';
import 'package:flutter_template/features/api_interact_example/di/api_interact_example_scope.dart';
import 'package:flutter_template/features/api_interact_example/presentation/screens/api_interact_example/api_interact_example_screen.dart';

/// {@template api_interact_example_flow.class}
/// Flow point to feature 
/// {@endtemplate}
@RoutePage()
class ApiInteractExampleFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro api_interact_example_flow.class}
  const ApiInteractExampleFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    const repository = ApiInteractExampleRepository();

    return DiScope<IApiInteractExampleScope>(
      factory: () => ApiInteractExampleScope(repository),
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ApiInteractExampleScreen();
  }
}
