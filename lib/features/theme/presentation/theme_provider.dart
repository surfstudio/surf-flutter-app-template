import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/presentation/theme_wm.dart';

/// {@template theme_provider.class}
/// The theme provider that allows to subscribe to the current [ThemeMode] and set it.
/// {@endtemplate}
class ThemeProvider extends InheritedWidget {
  final IThemeWM _wm;
  final ThemeMode _themeMode;

  /// {@macro theme_provider.class}
  const ThemeProvider({
    required super.child,
    required IThemeWM wm,
    required ThemeMode themeMode,
    super.key,
  })  : _wm = wm,
        _themeMode = themeMode;

  /// Current theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Set theme mode.
  void setThemeMode(ThemeMode themeMode) => _wm.setThemeMode(themeMode);

  /// Switch theme mode to the opposite.
  void switchThemeMode() => _wm.switchThemeMode();

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return _themeMode != oldWidget.themeMode;
  }

  /// Watch the [ThemeProvider] from the given [context].
  static ThemeProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }

  /// Read the [ThemeProvider] from the given [context].
  static ThemeProvider? read(BuildContext context) {
    return context.getElementForInheritedWidgetOfExactType<ThemeProvider>()?.widget as ThemeProvider?;
  }
}
