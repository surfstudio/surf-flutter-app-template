import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/i_theme_service.dart';

/// A service that stores and retrieves app theme mode.
class ThemeService extends IThemeService {
  late ThemeMode _themeMode;

  @override
  ThemeMode get currentThemeMode => _themeMode;

  /// Create an instance [ThemeService].
  ThemeService(this._themeMode);

  @override
  void switchTheme() {
    _themeMode == ThemeMode.light ? _themeMode = ThemeMode.dark : _themeMode = ThemeMode.light;
    notifyListeners();
  }

  @override
  void updateThemeMode(ThemeMode newThemeMode) {
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();
  }
}
