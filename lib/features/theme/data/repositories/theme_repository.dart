import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/domain/repositories/i_theme_repository.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';

/// {@template theme_repository.class}
/// Implementation of [IThemeRepository]
/// {@endtemplate}
final class ThemeRepository implements IThemeRepository {
  final IThemeModeStorage _themeModeStorage;

  /// {@macro theme_repository.class}
  ThemeRepository({
    required IThemeModeStorage themeModeStorage,
  }) : _themeModeStorage = themeModeStorage;

  @override
  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    await _themeModeStorage.saveThemeMode(mode: newThemeMode);
  }

  @override
  Future<ThemeMode?> getThemeMode() async {
    return _themeModeStorage.getThemeMode();
  }
}
