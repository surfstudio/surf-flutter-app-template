// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_text_scheme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppTextSchemeTailorMixin on ThemeExtension<AppTextScheme> {
  TextStyle get display;
  TextStyle get headline;
  TextStyle get label;

  @override
  AppTextScheme copyWith({
    TextStyle? display,
    TextStyle? headline,
    TextStyle? label,
  }) {
    return AppTextScheme(
      display: display ?? this.display,
      headline: headline ?? this.headline,
      label: label ?? this.label,
    );
  }

  @override
  AppTextScheme lerp(covariant ThemeExtension<AppTextScheme>? other, double t) {
    if (other is! AppTextScheme) return this as AppTextScheme;
    return AppTextScheme(
      display: TextStyle.lerp(display, other.display, t)!,
      headline: TextStyle.lerp(headline, other.headline, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTextScheme &&
            const DeepCollectionEquality().equals(display, other.display) &&
            const DeepCollectionEquality().equals(headline, other.headline) &&
            const DeepCollectionEquality().equals(label, other.label));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(display),
      const DeepCollectionEquality().hash(headline),
      const DeepCollectionEquality().hash(label),
    );
  }
}

extension AppTextSchemeBuildContext on BuildContext {
  AppTextScheme get appTextScheme => Theme.of(this).extension<AppTextScheme>()!;
}
