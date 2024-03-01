import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/theme_mode/di/theme_mode_scope.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_model.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_widget.dart';
import 'package:provider/provider.dart';

/// DI factory for [ThemeModeWM].
ThemeModeWM defaultThemeWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final scope = context.read<IThemeModeScope>();

  return ThemeModeWM(
    ThemeModeModel(
      repository: scope.repository,
      logWriter: appScope.logger,
    ),
  );
}

/// Interface for [ThemeModeWM].
abstract interface class IThemeModeWM implements IWidgetModel {
  /// Current theme mode.
  ValueListenable<ThemeMode> get themeMode;

  /// Set theme mode.
  Future<void> setThemeMode(ThemeMode themeMode);

  /// Switch theme mode to the opposite.
  Future<void> switchThemeMode();
}

/// {@template theme_wm.class}
/// [WidgetModel] for [ThemeModeWidget].
/// {@endtemplate}
final class ThemeModeWM extends WidgetModel<ThemeModeWidget, ThemeModeModel> implements IThemeModeWM {
  /// {@macro theme_wm.class}
  ThemeModeWM(super._model);

  @override
  ValueListenable<ThemeMode> get themeMode => model.themeMode;

  @override
  Future<void> setThemeMode(ThemeMode themeMode) => model.setThemeMode(themeMode);

  @override
  Future<void> switchThemeMode() => model.switchThemeMode();
}
