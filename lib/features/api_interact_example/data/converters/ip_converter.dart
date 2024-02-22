import 'package:flutter_template/api/service/ip/data/ip_dto.dart';
import 'package:flutter_template/core/architecture/data/converter/converter.dart';
import 'package:flutter_template/features/api_interact_example/domain/entities/ip_entity.dart';

/// Converter for [IpEntity]
typedef IIpConverter = Converter<IpEntity, IpDto>;

/// {@template category_converter.class}
/// Implementation of [IIpConverter]
/// {@endtemplate}
final class IpConverter extends IIpConverter {
  /// {@macro category_converter.class}
  const IpConverter();

  @override
  IpEntity convert(IpDto from) {
    return IpEntity(ip: from.ip);
  }
}
