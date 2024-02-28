import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/domain/repositories/i_theme_repository.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';
import 'package:rxdart/subjects.dart';

const _themeByDefault = ThemeMode.system;

/// {@template theme_repository.class}
/// Implementation of [IThemeRepository]
/// {@endtemplate}
final class ThemeRepository implements IThemeRepository {
  final IThemeModeStorage _themeModeStorage;

  /// {@macro theme_repository.class}
  ThemeRepository({
    required IThemeModeStorage themeModeStorage,
  }) : _themeModeStorage = themeModeStorage {
    _init();
  }

  final _themeSubject = BehaviorSubject<ThemeMode?>();

  @override
  Stream<ThemeMode?> get watchThemeMode => _themeSubject.stream;

  Future<void> _init() async {
    final themeMode = await _themeModeStorage.getThemeMode();
    _themeSubject.add(themeMode ?? _themeByDefault);
  }

  @override
  void setThemeMode(ThemeMode newThemeMode) {
    _themeModeStorage.saveThemeMode(mode: newThemeMode);
    _themeSubject.add(newThemeMode);
  }

  @override
  Future<ThemeMode?> getThemeMode() async {
    return _themeModeStorage.getThemeMode();
  }

  @override
  void dispose() {
    _themeSubject.close();
  }
}
