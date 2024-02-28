import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/presentation/theme_provider.dart';
import 'package:flutter_template/features/theme/presentation/theme_wm.dart';

/// {@template theme_widget.class}
/// ThemeWidget
/// {@endtemplate}
class ThemeWidget extends ElementaryWidget<IThemeWM> {
  /// Child
  final Widget child;

  /// {@macro theme_widget.class}
  const ThemeWidget({
    required this.child, super.key,
    WidgetModelFactory wmFactory = defaultThemeWMFactory,
  }) : super(wmFactory);

  @override
  Widget build(IThemeWM wm) {
    return ValueListenableBuilder(
      valueListenable: wm.themeMode,
      builder: (_, themeMode, __) => ThemeProvider(
        child: child,
        wm: wm,
        themeMode: themeMode,
      ),
    );
  }
}
