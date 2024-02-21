import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/text/text_style.dart';

/// App text style scheme.
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  /// Text style with a size of 45/52.
  /// Use for short, important text or numerals
  final TextStyle display;

  /// Text style with a size of 28/36.
  /// Use for marking primary passages of text or important regions of content.
  final TextStyle headline;

  /// Text style with a size of 12/16.
  /// Use for things like the text inside components or for very small text in the content body.
  final TextStyle label;

  AppTextTheme._({
    required this.display,
    required this.headline,
    required this.label,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : display = AppTextStyle.displayMedium.value,
        headline = AppTextStyle.headlineMedium.value,
        label = AppTextStyle.labelMedium.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      display: TextStyle.lerp(display, other.display, t)!,
      headline: TextStyle.lerp(headline, other.headline, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
    );
  }

  /// Return text theme for app from context.
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ?? _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  @override
  AppTextTheme copyWith({
    TextStyle? display,
    TextStyle? headline,
    TextStyle? label,
  }) {
    return AppTextTheme._(
      display: display ?? this.display,
      headline: headline ?? this.headline,
      label: label ?? this.label,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme not found in $context');
