import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/info/presentation/screens/info/info_wm.dart';

/// Main widget for InfoScreen feature.
class InfoScreen extends ElementaryWidget<IInfoWidgetModel> {
  /// Create an instance [InfoScreen].
  const InfoScreen({
    Key? key,
    WidgetModelFactory wmFactory = infoScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInfoWidgetModel wm) {
    return ColoredBox(
      color: wm.colorScheme.background,
      child: const Center(
        child: Text('Info screen view'),
      ),
    );
  }
}
