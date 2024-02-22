import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/persistence/storage/theme_storage/i_theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template theme_storage.class}
/// Persistent storage for theme mode.
///
/// Based on SharedPreferences.
/// {@endtemplate}
class ThemeStorage implements IThemeStorage {
  final SharedPreferences _prefs;

  /// Create an instance [ThemeStorage].
  /// {@macro theme_storage.class}
  const ThemeStorage(this._prefs);

  @override
  Future<ThemeMode?> getThemeMode() async {
    final themeName = _prefs.getString(ThemeStorageKeys.mode.keyName);
    if (themeName?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhereOrNull((e) => e.name == themeName);
  }

  @override
  Future<void> saveThemeMode({required ThemeMode mode}) =>
      _prefs.setString(ThemeStorageKeys.mode.keyName, mode.name);
}

/// Keys for [ThemeStorage].
enum ThemeStorageKeys {
  /// Theme mode (dark, system ...).
  mode('mode');

  /// Key Name.
  final String keyName;

  const ThemeStorageKeys(this.keyName);
}
