import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/data/converter/converter.dart';

/// Converter for [Url].
typedef IUrlConverter = ConverterToAndFrom<Url, String>;

/// {@template url_type_converter.class}
/// Implementation of [IUrlConverter].
/// {@endtemplate}
final class UrlConverter extends IUrlConverter {
  @override
  Converter<Url, String> get converter => const _UrlConverter();

  @override
  Converter<String, Url> get reverseConverter => const _UrlReverseConverter();

  /// {@macro url_type_converter.class}
  const UrlConverter();
}

final class _UrlConverter extends Converter<Url, String> {
  const _UrlConverter();

  @override
  Url convert(String input) {
    return switch (input) {
      'dev' => Url.dev,
      'prod' => Url.prod,
      _ => throw ArgumentError('Unknown url type: $input'),
    };
  }
}

final class _UrlReverseConverter extends Converter<String, Url> {
  const _UrlReverseConverter();

  @override
  String convert(Url input) {
    return switch (input) {
      Url.dev => 'dev',
      Url.prod => 'prod',
    };
  }
}
