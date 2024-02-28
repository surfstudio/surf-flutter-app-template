import 'package:flutter_template/core/architecture/data/converter/converter.dart';
import 'package:flutter_template/features/debug/domain/entities/url_type_entity.dart';

/// Converter for [UrlTypeEntity]
typedef IUrlTypeConverter = ConverterToAndFrom<UrlTypeEntity, String>;

/// {@template url_type_converter.class}
/// Implementation of [IUrlTypeConverter]
/// {@endtemplate}
final class UrlTypeConverter extends IUrlTypeConverter {
  /// {@macro url_type_converter.class}
  const UrlTypeConverter();

  @override
  Converter<UrlTypeEntity, String> get converter => const _UrlTypeConverter();

  @override
  Converter<String, UrlTypeEntity> get reverseConverter => const _UrlTypeReverseConverter();
}

final class _UrlTypeConverter extends Converter<UrlTypeEntity, String> {
  const _UrlTypeConverter();

  @override
  UrlTypeEntity convert(String input) {
    return switch (input) {
      'dev' => UrlTypeEntity.dev,
      'test' => UrlTypeEntity.qa,
      'prod' => UrlTypeEntity.prod,
      _ => throw ArgumentError('Unknown url type: $input'),
    };
  }
}

final class _UrlTypeReverseConverter extends Converter<String, UrlTypeEntity> {
  const _UrlTypeReverseConverter();

  @override
  String convert(UrlTypeEntity input) {
    return switch (input) {
      UrlTypeEntity.dev => 'dev',
      UrlTypeEntity.qa => 'test',
      UrlTypeEntity.prod => 'prod',
    };
  }
}
