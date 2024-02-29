import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/presentation/theme_wm.dart';
import 'package:provider/provider.dart';

/// {@template theme_widget.class}
/// ThemeWidget is a widget that provides the [IThemeWM] to its descendants.
/// {@endtemplate}
class ThemeWidget extends ElementaryWidget<IThemeWM> {
  /// Child
  final Widget child;

  /// {@macro theme_widget.class}
  const ThemeWidget({
    required this.child,
    super.key,
    WidgetModelFactory wmFactory = defaultThemeWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IThemeWM wm) {
    return Provider<IThemeWM>.value(value: wm, child: child);
  }
}
