import 'package:flutter/material.dart';

/// A service that stores and retrieves app theme mode.
abstract class IThemeService extends ChangeNotifier {
  /// Current app theme mode.
  ThemeMode get currentThemeMode;

  /// Switch theme mode between light and dark.
  void switchTheme();

  /// Select theme mode.
  void updateThemeMode(ThemeMode newThemeMode);
}
