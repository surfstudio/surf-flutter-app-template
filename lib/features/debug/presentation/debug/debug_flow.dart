import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/debug/di/debug_scope.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_screen.dart';

/// {@template debug_flow.class}
/// Entry of debug feature.
/// {@endtemplate}
@RoutePage()
class DebugFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro debug_flow.class}
  const DebugFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IDebugScope>(
      factory: DebugScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DebugScreen();
  }
}
