import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/dash/screen/dash_screen_export.dart';

/// Main widget for DashScreen feature
class DashScreen extends ElementaryWidget<IDashScreenWidgetModel> {
  /// Create an instance [DashScreen].
  const DashScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultDashScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDashScreenWidgetModel wm) {
    return Container();
  }
}
