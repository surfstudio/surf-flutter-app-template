import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/presentation/theme_notifier.dart';
import 'package:flutter_template/features/theme/presentation/theme_wm.dart';
import 'package:provider/provider.dart';

/// {@template theme_widget.class}
/// ThemeWidget
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
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(wm: wm),
      child: child,
    );
  }
}
