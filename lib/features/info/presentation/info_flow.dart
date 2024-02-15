import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/info/di/info_scope.dart';
import 'package:flutter_template/features/info/presentation/screens/info/info_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// Entry of template feature.
@RoutePage(name: AppRouteNames.tempScreen)
class InfoFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro scan_biomarkers_entry.class}
  const InfoFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<InfoScope>(
      factory: InfoScope.create,
      dispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const InfoScreen();
  }
}
