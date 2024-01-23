import 'package:flutter/material.dart';
import 'package:flutter_template/features/common/service/theme/theme_service.dart';

/// A service that stores and retrieves app theme mode.
class ThemeServiceImpl extends IThemeService {
  @override
  ThemeMode get currentThemeMode => _themeMode;

  late ThemeMode _themeMode;

  /// Create an instance [ThemeServiceImpl].
  ThemeServiceImpl(this._themeMode);

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
