import 'package:freezed_annotation/freezed_annotation.dart';

part 'ip_entity.freezed.dart';

/// {@template ip_entity.class}
/// IP address.
/// {@endtemplate}
@freezed
class IpEntity with _$IpEntity {
  /// {@macro ip_entity.class}
  const factory IpEntity({
    /// IP address.
    required String ip,
  }) = _IpEntity;
}
