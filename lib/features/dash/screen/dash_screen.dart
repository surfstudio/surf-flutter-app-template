import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/dash/screen/dash_screen_wm.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for DashScreen feature.
@RoutePage(
  name: AppRouteNames.dashScreen,
)
class DashScreen extends ElementaryWidget<IDashScreenWidgetModel> {
  /// Create an instance [DashScreen].
  const DashScreen({
    Key? key,
    WidgetModelFactory wmFactory = dashScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDashScreenWidgetModel wm) {
    return ColoredBox(
      color: wm.colorScheme.background,
      child: const Center(
        child: Text('Dash screen view'),
      ),
    );
  }
}
