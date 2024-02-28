import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/domain/repositories/i_theme_repository.dart';
import 'package:flutter_template/features/theme/presentation/theme_widget.dart';

/// {@template theme_model.class}
/// [ElementaryModel] for [ThemeWidget]
/// {@endtemplate}
final class ThemeModel extends ElementaryModel {
  final IThemeRepository _repository;
  late final StreamSubscription<ThemeMode?> _themeModeSubscription;

  /// {@macro theme_model.class}
  ThemeModel({
    required IThemeRepository repository,
    super.errorHandler,
  }) : _repository = repository;

  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.light);

  /// Current theme mode.
  ValueListenable<ThemeMode> get themeMode => _themeMode;

  @override
  void init() {
    _themeModeSubscription = _repository.watchThemeMode.listen(_themeModeListener);
    super.init();
  }

  void _themeModeListener(ThemeMode? mode) {
    _themeMode.value = mode ?? ThemeMode.light;
  }

  /// Switch theme mode to the opposite.
  void switchThemeMode() {
    final newThemeMode = _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _repository.setThemeMode(newThemeMode);
  }

  /// Set theme mode.
  void setThemeMode(ThemeMode newThemeMode) {
    if (newThemeMode == _themeMode.value) return;
    _repository.setThemeMode(newThemeMode);
  }

  @override
  void dispose() {
    _themeModeSubscription.cancel();
    super.dispose();
  }
}
