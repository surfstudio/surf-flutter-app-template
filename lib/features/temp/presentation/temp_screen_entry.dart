import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/temp/di/template_scope.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp_screen/temp_screen_export.dart';

/// Entry of template feature.
@RoutePage(name: AppRouteNames.tempScreen)
class TemplateEntry extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro scan_biomarkers_entry.class}
  const TemplateEntry({
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<ITemplateScope>(
      factory: TemplateScope.create,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const TempScreen();
  }
}
