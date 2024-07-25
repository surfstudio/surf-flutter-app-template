// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/text/app_text_style.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_text_scheme.tailor.dart';

/// App text style scheme.
@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class AppTextScheme extends ThemeExtension<AppTextScheme> with _$AppTextSchemeTailorMixin {
  /// Text style with a size of 45/52.
  /// Use for short, important text or numerals.
  @override
  final TextStyle display;

  /// Text style with a size of 28/36.
  /// Use for marking primary passages of text or important regions of content.
  @override
  final TextStyle headline;

  /// Text style with a size of 12/16.
  /// Use for things like the text inside components or for very small text in the content body.
  @override
  final TextStyle label;

  /// @odoc
  const AppTextScheme({
    required this.display,
    required this.headline,
    required this.label,
  });

  /// Base app text theme.
  AppTextScheme.base()
      : display = AppTextStyle.displayMedium.value,
        headline = AppTextStyle.headlineMedium.value,
        label = AppTextStyle.labelMedium.value;
}
