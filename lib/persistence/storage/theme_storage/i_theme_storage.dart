import 'package:flutter/material.dart';
/// {@template i_theme_storage.class}
/// Persistent storage for theme mode.
/// {@endtemplate}
abstract class IThemeStorage {
  /// Returns saved theme mode.
  Future<ThemeMode?> getThemeMode();

  /// Save selected theme mode.
  Future<void> saveThemeMode({required ThemeMode mode});
}
