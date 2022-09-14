import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/info/screen/info_screen_export.dart';

/// Main widget for InfoScreen feature
class InfoScreen extends ElementaryWidget<IInfoScreenWidgetModel> {
  /// Create an instance [InfoScreen].
  const InfoScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultInfoScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IInfoScreenWidgetModel wm) {
    return Container();
  }
}
