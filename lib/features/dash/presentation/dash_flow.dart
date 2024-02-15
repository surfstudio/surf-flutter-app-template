import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/dash/di/dash_scope.dart';
import 'package:flutter_template/features/dash/presentation/screens/dash/dash_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// Entry of template feature.
@RoutePage(name: AppRouteNames.dashScreen)
class DashFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro scan_biomarkers_entry.class}
  const DashFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<DashScope>(
      factory: DashScope.create,
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DashScreen();
  }
}
