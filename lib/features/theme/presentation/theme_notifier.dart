import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/presentation/theme_wm.dart';

/// {@template theme_provider.class}
/// The theme provider that allows to subscribe to the current [ThemeMode] and set it.
/// {@endtemplate}
class ThemeNotifier extends ChangeNotifier {
  final IThemeWM _wm;

  /// {@macro theme_provider.class}
  ThemeNotifier({required IThemeWM wm}) : _wm = wm;

  /// Current theme mode.
  ThemeMode get themeMode => _wm.themeMode.value;

  /// Set theme mode.
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _wm.setThemeMode(themeMode);
    notifyListeners();
  }

  /// Switch theme mode to the opposite.
  Future<void> switchThemeMode() async {
    await _wm.switchThemeMode();
    notifyListeners();
  }
}
