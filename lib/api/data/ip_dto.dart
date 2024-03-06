import 'package:json_annotation/json_annotation.dart';

part 'ip_dto.g.dart';

/// {@template ip_dto.class}
/// DTO for IP address.
/// {@endtemplate}
@JsonSerializable()
class IpDto {
  /// IP address.
  final String ip;

  /// {@macro ip_dto.class}
  const IpDto({required this.ip});

  /// Get DTO object from json.
  factory IpDto.fromJson(Map<String, dynamic> json) => _$IpDtoFromJson(json);

  /// Convert a DTO object to json.
  Map<String, dynamic> toJson() => _$IpDtoToJson(this);
}
