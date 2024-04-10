import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/feature_example/di/feature_example_scope.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_screen.dart';

/// {@template feature_example_flow.class}
/// Entry point for the feature.
/// {@endtemplate}
@RoutePage()
class FeatureExampleFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro feature_example_flow.class}
  const FeatureExampleFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IFeatureExampleScope>(
      factory: FeatureExampleScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const FeatureExampleScreen();
  }
}
