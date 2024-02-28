import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/theme/di/theme_scope.dart';
import 'package:flutter_template/features/theme/presentation/theme_model.dart';
import 'package:flutter_template/features/theme/presentation/theme_widget.dart';
import 'package:provider/provider.dart';

/// DI factory for [ThemeWM].
ThemeWM defaultThemeWMFactory(BuildContext context) {
  final scope = context.read<IThemeScope>();

  return ThemeWM(ThemeModel(repository: scope.repository));
}

/// Interface for [ThemeWM].
abstract interface class IThemeWM implements IWidgetModel {
  /// Current theme mode.
  ValueListenable<ThemeMode> get themeMode;

  /// Set theme mode.
  void setThemeMode(ThemeMode themeMode);

  /// Switch theme mode to the opposite.
  void switchThemeMode();
}

/// {@template theme_wm.class}
/// [WidgetModel] for [ThemeWidget].
/// {@endtemplate}
final class ThemeWM extends WidgetModel<ThemeWidget, ThemeModel> implements IThemeWM {
  /// {@macro theme_wm.class}
  ThemeWM(super._model);

  @override
  ValueListenable<ThemeMode> get themeMode => model.themeMode;

  @override
  void setThemeMode(ThemeMode themeMode) => model.setThemeMode(themeMode);

  @override
  void switchThemeMode() => model.switchThemeMode();
}
