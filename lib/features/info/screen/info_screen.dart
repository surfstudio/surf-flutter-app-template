import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/info/screen/info_screen_wm.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// Main widget for InfoScreen feature.
@RoutePage(
  name: AppRouteNames.infoScreen,
)
class InfoScreen extends ElementaryWidget<IInfoScreenWidgetModel> {
  /// Create an instance [InfoScreen].
  const InfoScreen({
    Key? key,
    WidgetModelFactory wmFactory = infoScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInfoScreenWidgetModel wm) {
    return ColoredBox(
      color: wm.colorScheme.background,
      child: const Center(
        child: Text('Info screen view'),
      ),
    );
  }
}
