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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Dash screen view'),
          const SizedBox(height: 16),
          Text('Кнопка ${wm.l10n.positiveResponse}'),
          Text(wm.l10n.string('Username')),
          Text(wm.l10n.thingsWithCount(1)),
          Text(wm.l10n.date(DateTime.now())),
        ],
      ),
    );
  }
}
