import 'package:flutter_template/config/environment/build_types.dart';
import 'package:flutter_template/core/architecture/data/converter/converter.dart';
import 'package:flutter_template/features/debug/domain/entities/url_type_entity.dart';

/// Converter for [BuildType]
typedef IUrlTypeToBuildTypeConverter = Converter<BuildType, UrlTypeEntity>;

/// {@template url_type_to_build_type_converter.class}
/// Implementation of [IUrlTypeToBuildTypeConverter]
/// {@endtemplate}
final class UrlTypeToBuildTypeConverter extends IUrlTypeToBuildTypeConverter {
  /// {@macro url_type_to_build_type_converter.class}
  const UrlTypeToBuildTypeConverter();

  @override
  BuildType convert(UrlTypeEntity input) {
    return switch (input) {
      UrlTypeEntity.dev => BuildType.dev,
      UrlTypeEntity.qa => BuildType.qa,
      UrlTypeEntity.prod => BuildType.prod,
    };
  }
}
