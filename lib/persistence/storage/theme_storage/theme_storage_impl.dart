import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for theme mode.
///
/// Based on SharedPreferences.
class ThemeModeStorageImpl implements IThemeModeStorage {
  static const String _themeModeKey = 'theme_mode';

  /// Create an instance [ThemeModeStorageImpl].
  ThemeModeStorageImpl();

  @override
  Future<ThemeMode?> getThemeMode() async {
    final themeName =
        (await SharedPreferences.getInstance()).getString(_themeModeKey);
    if (themeName?.isEmpty ?? true) return null;
    return ThemeMode.values.firstWhereOrNull((e) => e.name == themeName);
  }

  @override
  Future<void> saveThemeMode({required ThemeMode mode}) async {
    await (await SharedPreferences.getInstance())
        .setString(_themeModeKey, mode.name);
  }
}
