// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';

part 'color_palette.dart';

const _skeletonOpacity = 0.06;

/// App brand color scheme.
///
/// This extension is in sync with base [ThemeData] and [ColorScheme].
///
/// Use case:
///
/// ```dart
/// final colorScheme = AppColorScheme.of(context);
///
/// return Container(color: colorScheme.primary);
/// ```
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// Base branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color primary;

  /// The color of the text on [primary].
  final Color onPrimary;

  /// Secondary branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  ///
  /// Complements [primary] color.
  final Color secondary;

  /// The color of the text on [secondary].
  final Color onSecondary;

  /// Surface color.
  ///
  /// Usually, the background color of cards, alerts, dialogs, bottom sheets, etc
  /// is considered a surface.
  final Color surface;

  /// Secondary surface color.
  ///
  /// Usually, the background color of cards, alerts, dialogs, bottom sheets, etc
  /// is considered a surface.
  final Color surfaceSecondary;

  /// The color of the text on [surface].
  final Color onSurface;

  /// Background color.
  ///
  /// Usually refers to the general background of the screen.
  final Color background;

  /// Secondary background color.
  ///
  /// Usually refers to the general background of the screen.
  final Color backgroundSecondary;

  /// Tertiary background color.
  ///
  /// Usually refers to the general background of the screen.
  final Color backgroundTertiary;

  /// Tetradic background color.
  ///
  /// Usually refers to the general background of the screen.
  final Color tetradicBackground;

  /// The color of the text on [background].
  final Color onBackground;

  /// The color of the text on [background]. Muted version.
  final Color onBackgroundSecondary;

  /// Color of danger.
  ///
  /// Commonly used to display errors.
  ///
  /// Can be used as an accent color for text/background of an error message/destructive button.
  final Color danger;

  /// Secondary color of danger.
  ///
  /// Commonly used to display errors.
  ///
  /// Can be used as an accent color for text/background of an error message/destructive button.
  final Color dangerSecondary;

  /// The color of the text on [danger].
  final Color onDanger;

  /// Color of text in text field.
  final Color textField;

  /// Color of label in text field.
  final Color textFieldLabel;

  /// Color of helper text in text field.
  final Color textFieldHelper;

  /// Color of border and cursor in text field.
  final Color frameTextFieldSecondary;

  /// Color of inactive elements.
  final Color inactive;

  /// Positive color.
  ///
  /// Typically used for informational success messages.
  final Color positive;

  /// The color of the text on [positive].
  final Color onPositive;

  /// Primary skeleton color.
  final Color skeletonPrimary;

  /// The color of the text on [skeletonPrimary].
  final Color skeletonOnPrimary;

  /// Secondary skeleton color.
  final Color skeletonSecondary;

  /// Tertiary skeleton color.
  final Color skeletonTertiary;

  /// The color of the shimmer.
  final Color shimmer;

  /// Base light theme version.
  AppColorScheme.light()
      : primary = ColorPalette._purple,
        onPrimary = ColorPalette._white,
        secondary = ColorPalette._greenYellow,
        onSecondary = ColorPalette._chineseBlack,
        surface = ColorPalette._white,
        surfaceSecondary = ColorPalette._cultured,
        onSurface = ColorPalette._chineseBlack,
        background = ColorPalette._cultured,
        backgroundSecondary = ColorPalette._darkScarlet,
        backgroundTertiary = ColorPalette._cultured,
        onBackground = ColorPalette._chineseBlack,
        onBackgroundSecondary = ColorPalette._white,
        danger = ColorPalette._folly,
        dangerSecondary = ColorPalette._vividRaspberry,
        onDanger = ColorPalette._white,
        textField = ColorPalette._chineseBlack,
        textFieldLabel = ColorPalette._black,
        textFieldHelper = ColorPalette._black,
        frameTextFieldSecondary = ColorPalette._chineseBlack,
        inactive = ColorPalette._black,
        positive = ColorPalette._greenYellow,
        onPositive = ColorPalette._chineseBlack,
        skeletonPrimary = ColorPalette._black.withOpacity(_skeletonOpacity),
        skeletonOnPrimary = ColorPalette._white,
        skeletonSecondary = ColorPalette._cultured,
        skeletonTertiary = ColorPalette._lightSilver,
        tetradicBackground = ColorPalette._lightGreen,
        shimmer = ColorPalette._platinum;

  /// Base dark theme version.
  AppColorScheme.dark()
      : primary = DarkColorPalette._hanPurple,
        onPrimary = DarkColorPalette._white,
        secondary = DarkColorPalette._inchworm,
        onSecondary = DarkColorPalette._black,
        surface = DarkColorPalette._raisinBlack,
        surfaceSecondary = DarkColorPalette._raisinBlack,
        onSurface = DarkColorPalette._white,
        background = DarkColorPalette._raisinBlack,
        backgroundSecondary = DarkColorPalette._maroon,
        backgroundTertiary = DarkColorPalette._raisinBlack,
        onBackground = DarkColorPalette._white,
        onBackgroundSecondary = DarkColorPalette._white,
        danger = DarkColorPalette._brinkPink,
        dangerSecondary = DarkColorPalette._cyclamen,
        onDanger = DarkColorPalette._white,
        textField = DarkColorPalette._lightSilver,
        textFieldLabel = DarkColorPalette._white,
        textFieldHelper = DarkColorPalette._black,
        frameTextFieldSecondary = DarkColorPalette._lightSilver,
        inactive = DarkColorPalette._black,
        positive = DarkColorPalette._inchworm,
        onPositive = DarkColorPalette._black,
        skeletonPrimary = DarkColorPalette._black.withOpacity(_skeletonOpacity),
        skeletonOnPrimary = DarkColorPalette._white,
        skeletonSecondary = DarkColorPalette._raisinBlack,
        skeletonTertiary = DarkColorPalette._lightSilver,
        tetradicBackground = DarkColorPalette._etonBlue,
        shimmer = ColorPalette._platinum;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.surfaceSecondary,
    required this.onSurface,
    required this.background,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.onBackground,
    required this.onBackgroundSecondary,
    required this.danger,
    required this.dangerSecondary,
    required this.onDanger,
    required this.textField,
    required this.textFieldLabel,
    required this.textFieldHelper,
    required this.frameTextFieldSecondary,
    required this.inactive,
    required this.positive,
    required this.onPositive,
    required this.skeletonPrimary,
    required this.skeletonOnPrimary,
    required this.skeletonSecondary,
    required this.skeletonTertiary,
    required this.tetradicBackground,
    required this.shimmer,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? surfaceSecondary,
    Color? onSurface,
    Color? background,
    Color? backgroundSecondary,
    Color? backgroundTertiary,
    Color? onBackground,
    Color? onBackgroundSecondary,
    Color? danger,
    Color? dangerSecondary,
    Color? onDanger,
    Color? textField,
    Color? textFieldLabel,
    Color? textFieldHelper,
    Color? frameTextFieldSecondary,
    Color? inactive,
    Color? positive,
    Color? onPositive,
    Color? skeletonPrimary,
    Color? skeletonOnPrimary,
    Color? skeletonSecondary,
    Color? skeletonTertiary,
    Color? tetradicBackground,
    Color? shimmer,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
      onBackground: onBackground ?? this.onBackground,
      onBackgroundSecondary: onBackgroundSecondary ?? this.onBackgroundSecondary,
      danger: danger ?? this.danger,
      dangerSecondary: dangerSecondary ?? this.dangerSecondary,
      onDanger: onDanger ?? this.onDanger,
      textField: textField ?? this.textField,
      textFieldLabel: textFieldLabel ?? this.textFieldLabel,
      textFieldHelper: textFieldHelper ?? this.textFieldHelper,
      frameTextFieldSecondary: frameTextFieldSecondary ?? this.frameTextFieldSecondary,
      inactive: inactive ?? this.inactive,
      positive: positive ?? this.positive,
      onPositive: onPositive ?? this.onPositive,
      skeletonPrimary: skeletonPrimary ?? this.skeletonPrimary,
      skeletonOnPrimary: skeletonOnPrimary ?? this.skeletonOnPrimary,
      skeletonSecondary: skeletonSecondary ?? this.skeletonSecondary,
      skeletonTertiary: skeletonTertiary ?? this.skeletonTertiary,
      tetradicBackground: tetradicBackground ?? this.tetradicBackground,
      shimmer: shimmer ?? this.shimmer,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary: Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundSecondary: Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      backgroundTertiary: Color.lerp(backgroundTertiary, other.backgroundTertiary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackgroundSecondary: Color.lerp(onBackgroundSecondary, other.onBackgroundSecondary, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerSecondary: Color.lerp(dangerSecondary, other.dangerSecondary, t)!,
      onDanger: Color.lerp(onDanger, other.onDanger, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      textFieldLabel: Color.lerp(textFieldLabel, other.textFieldLabel, t)!,
      textFieldHelper: Color.lerp(textFieldHelper, other.textFieldHelper, t)!,
      frameTextFieldSecondary:
          Color.lerp(frameTextFieldSecondary, other.frameTextFieldSecondary, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      positive: Color.lerp(positive, other.positive, t)!,
      onPositive: Color.lerp(onPositive, other.onPositive, t)!,
      skeletonPrimary: Color.lerp(skeletonPrimary, other.skeletonPrimary, t)!,
      skeletonOnPrimary: Color.lerp(skeletonOnPrimary, other.skeletonOnPrimary, t)!,
      skeletonSecondary: Color.lerp(skeletonSecondary, other.skeletonSecondary, t)!,
      skeletonTertiary: Color.lerp(skeletonTertiary, other.skeletonTertiary, t)!,
      tetradicBackground: Color.lerp(tetradicBackground, other.tetradicBackground, t)!,
      shimmer: Color.lerp(shimmer, other.shimmer, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) => Theme.of(context).extension<AppColorScheme>()!;
}
