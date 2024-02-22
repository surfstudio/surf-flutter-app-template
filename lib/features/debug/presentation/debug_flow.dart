import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/debug/di/debug_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// {@template debug_flow.class}
/// Entry of debug feature.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.debugScreen)
class DebugFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro debug_flow.class}
  const DebugFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IDebugScope>(
      onFactory: DebugScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DebugScreen();
  }
}
