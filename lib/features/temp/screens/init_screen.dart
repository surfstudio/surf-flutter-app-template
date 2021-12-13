import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/temp/screens/init_screen_widget_model.dart';

/// Initialization screens (this can be a HomeScreen or SplashScreen for example).

/// Debug screens.
class InitScreen extends ElementaryWidget<InitScreenWidgetModel> {
  /// Create an instance [InitScreen].
  const InitScreen({
    Key? key,
    WidgetModelFactory wmFactory = initScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(InitScreenWidgetModel wm) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: wm.openDebugScreen,
            child: const Text(
              'Open Debug screens',
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ),
      ),
    );
  }
}
