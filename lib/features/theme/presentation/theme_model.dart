import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/domain/repositories/i_theme_repository.dart';
import 'package:flutter_template/features/theme/presentation/theme_widget.dart';

const _themeByDefault = ThemeMode.system;

/// {@template theme_model.class}
/// [ElementaryModel] for [ThemeWidget]
/// {@endtemplate}
final class ThemeModel extends ElementaryModel {
  final IThemeRepository _repository;

  /// {@macro theme_model.class}
  ThemeModel({
    required IThemeRepository repository,
    super.errorHandler,
  }) : _repository = repository;

  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.light);

  /// Current theme mode.
  ValueListenable<ThemeMode> get themeMode => _themeMode;

  @override
  Future<void> init() async {
    final themeMode = await _repository.getThemeMode();
    _themeMode.value = themeMode ?? _themeByDefault;
  }

  /// Switch theme mode to the opposite.
  Future<void> switchThemeMode() async {
    final newThemeMode = _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _repository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }

  /// Set theme mode.
  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    await _repository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }
}
