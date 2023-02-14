import 'package:flutter/material.dart';
import 'package:flutter_template/assets/colors/colors.dart';

/// App color scheme.
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// The base color for app.
  final Color primary;

  /// The color of the elements that appears on top of a [primary].
  final Color onPrimary;

  /// A secondary color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color secondary;

  /// The color of the elements that appears on top of a [secondary].
  final Color onSecondary;

  /// Surface colors affect surfaces of components, such as cards, sheets, and menus.
  final Color surface;

  /// The color of the elements that appears on top of a [surface].
  final Color onSurface;

  /// The background color appears behind scrollable content.
  final Color background;

  /// The color of the elements that appears on top of a [background].
  final Color onBackground;

  /// Color for show errors.
  final Color error;

  /// The color of the elements that appears on top of a [error].
  final Color onError;

  /// Color for show selected items.
  final Color selectedItem;

  /// Color for show unselected items.
  final Color unselectedItem;

  /// Base light theme of the app.
  AppColorScheme.light()
      : primary = AppColors.cornflowerBlue.value,
        onPrimary = AppColors.white.value,
        secondary = AppColors.purple.value,
        onSecondary = AppColors.white.value,
        surface = AppColors.white.value,
        onSurface = AppColors.raisinBlack.value,
        background = AppColors.solitude.value,
        onBackground = AppColors.raisinBlack.value,
        error = AppColors.freeSpeechRed.value,
        onError = AppColors.white.value,
        selectedItem = AppColors.cornflowerBlue.value,
        unselectedItem = AppColors.darkGrey.value;

  /// Dark theme of the app.
  AppColorScheme.dark()
      : primary = AppColors.prussianBlue.value,
        onPrimary = AppColors.darkGrey.value,
        secondary = AppColors.oxfordBlue.value,
        onSecondary = AppColors.darkGrey.value,
        surface = AppColors.oxfordBlue.value,
        onSurface = AppColors.darkGrey.value,
        background = AppColors.jaguar.value,
        onBackground = AppColors.darkGrey.value,
        error = AppColors.freeSpeechRed.value,
        onError = AppColors.darkGrey.value,
        selectedItem = AppColors.horizon.value,
        unselectedItem = AppColors.darkGrey.value;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.selectedItem,
    required this.unselectedItem,
  });

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;
    return copyWith(
      primary: Color.lerp(primary, other.primary, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t),
      surface: Color.lerp(surface, other.surface, t),
      onSurface: Color.lerp(onSurface, other.onSurface, t),
      background: Color.lerp(background, other.background, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      error: Color.lerp(error, other.error, t),
      onError: Color.lerp(onError, other.onError, t),
      selectedItem: Color.lerp(selectedItem, other.selectedItem, t),
      unselectedItem: Color.lerp(unselectedItem, other.unselectedItem, t),
    );
  }

  /// Return color scheme for app from context
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>() ??
      _throwThemeExceptionFromFunc(context);

  /// @nodoc
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? error,
    Color? onError,
    Color? selectedItem,
    Color? unselectedItem,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      selectedItem: selectedItem ?? this.selectedItem,
      unselectedItem: unselectedItem ?? this.unselectedItem,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppColorScheme не найдена в $context');
