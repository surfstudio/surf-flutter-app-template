import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/debug/di/debug_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// Entry of template feature.
@RoutePage(name: AppRouteNames.tempScreen)
class DebugFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro scan_biomarkers_entry.class}
  const DebugFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<DebugScope>(
      factory: DebugScope.create,
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DebugScreen();
  }
}
