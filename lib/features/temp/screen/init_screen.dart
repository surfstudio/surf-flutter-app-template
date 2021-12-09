import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/temp/screen/init_screen_widget_model.dart';

/// Initialization screen (this can be a HomeScreen or SplashScreen for example).

/// Debug screen.
class InitScreen extends ElementaryWidget<InitScreenWidgetModel> {
  /// Create an instance [InitScreen].
  const InitScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(InitScreenWidgetModel wm) {
    return const Scaffold();
  }
}
