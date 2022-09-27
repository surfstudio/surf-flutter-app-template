import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/info/screen/info_screen_wm.dart';

/// Main widget for InfoScreen feature
class InfoScreen extends ElementaryWidget<IInfoScreenWidgetModel> {
  /// Create an instance [InfoScreen].
  const InfoScreen({
    Key? key,
    WidgetModelFactory wmFactory = infoScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInfoScreenWidgetModel wm) {
    return ColoredBox(
      color: Colors.grey.shade200,
      child: const Center(
        child: Text('Info screen view'),
      ),
    );
  }
}
