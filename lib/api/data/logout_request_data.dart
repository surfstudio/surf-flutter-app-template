// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'logout_request_data.g.dart';

/// Данные для разлогина.
@JsonSerializable(includeIfNull: false)
class LogoutRequestData {
  /// UUID для идентификации устройства
  @JsonKey(name: 'deviceId')
  final String deviceId;

  /// Флаг удаления аккаунта
  @JsonKey(name: 'deleteUser')
  final bool deleteUser;

  /// Данные для разлогина.
  const LogoutRequestData({
    required this.deviceId,
    required this.deleteUser,
  });

  /// Данные для разлогина.
  factory LogoutRequestData.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$LogoutRequestDataToJson(this);
}
