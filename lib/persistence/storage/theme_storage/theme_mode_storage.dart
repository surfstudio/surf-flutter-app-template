import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/persistence/storage/theme_storage/i_theme_mode_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for theme mode.
///
/// Based on SharedPreferences.
class ThemeModeStorage implements IThemeModeStorage {
  final SharedPreferences _prefs;

  /// Create an instance [ThemeModeStorage].
  const ThemeModeStorage(this._prefs);

  @override
  ThemeMode? getThemeMode() {
    final themeName = _prefs.getString(ThemeStorageKeys.mode.keyName);
    if (themeName?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhereOrNull((e) => e.name == themeName);
  }

  @override
  Future<void> saveThemeMode({required ThemeMode mode}) {
    return _prefs.setString(ThemeStorageKeys.mode.keyName, mode.name);
  }
}

/// Keys for [ThemeModeStorage].
enum ThemeStorageKeys {
  /// Theme mode.
  mode('theme_mode');

  /// Key Name.
  final String keyName;

  const ThemeStorageKeys(this.keyName);
}
