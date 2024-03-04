import 'package:flutter/material.dart';

/// Theme mode repository.
abstract interface class IThemeModeRepository {
  /// Set theme mode.
  Future<void> setThemeMode(ThemeMode newThemeMode);

  /// Get theme mode.
  ThemeMode? getThemeMode();
}
