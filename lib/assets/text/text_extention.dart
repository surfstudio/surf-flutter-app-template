import 'package:flutter/material.dart';
import 'package:flutter_template/assets/text/text_style.dart';

/// App text style scheme.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style 14_140.
  final TextStyle regular14;

  /// Text style 16_124.
  final TextStyle regular16;

  /// Text style 14_140_500.
  final TextStyle medium14;

  /// Text style 16_124_500.
  final TextStyle medium16;

  /// Text style 14_140_700.
  final TextStyle bold14;

  /// Text style 16_124_700.
  final TextStyle bold16;

  AppTextTheme._({
    required this.regular14,
    required this.regular16,
    required this.medium14,
    required this.medium16,
    required this.bold14,
    required this.bold16,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : regular14 = AppTextStyle.regular14.value,
        regular16 = AppTextStyle.regular16.value,
        medium14 = AppTextStyle.medium14.value,
        medium16 = AppTextStyle.medium16.value,
        bold14 = AppTextStyle.bold14.value,
        bold16 = AppTextStyle.bold16.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return copyWith(
      regular14: TextStyle.lerp(regular14, other.regular14, t),
      regular16: TextStyle.lerp(regular16, other.regular16, t),
      medium14: TextStyle.lerp(medium14, other.medium14, t),
      medium16: TextStyle.lerp(medium16, other.medium16, t),
      bold14: TextStyle.lerp(bold14, other.bold14, t),
      bold16: TextStyle.lerp(bold16, other.bold16, t),
    );
  }

  /// Return text theme for app from context
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? medium14,
    TextStyle? medium16,
    TextStyle? bold14,
    TextStyle? bold16,
  }) {
    return AppTextTheme._(
      regular14: regular14 ?? this.regular14,
      regular16: regular16 ?? this.regular16,
      medium14: medium14 ?? this.medium14,
      medium16: medium16 ?? this.medium16,
      bold14: bold14 ?? this.bold14,
      bold16: bold16 ?? this.bold16,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme не найдена в $context');
