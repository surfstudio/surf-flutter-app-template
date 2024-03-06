import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/persistence/storage/theme_storage/i_theme_mode_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for theme mode.
///
/// Based on SharedPreferences.
class ThemeModeStorageImpl implements IThemeModeStorage {
  static const _themeModeKey = 'theme_mode';
  final SharedPreferences _prefs;

  /// Create an instance [ThemeModeStorageImpl].
  const ThemeModeStorageImpl(this._prefs);

  @override
  ThemeMode? getThemeMode() {
    final themeName = _prefs.getString(_themeModeKey);
    if (themeName?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhereOrNull((e) => e.name == themeName);
  }

  @override
  Future<void> saveThemeMode({required ThemeMode mode}) {
    return _prefs.setString(_themeModeKey, mode.name);
  }
}
