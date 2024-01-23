// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: depend_on_referenced_packages, unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos

import 'package:json_annotation/json_annotation.dart';

part 'auth_by_code_verify_request_data.g.dart';

@JsonSerializable(includeIfNull: false)
class AuthByCodeVerifyRequestData {
  /// OTP-token для аутентификации пользователя
  @JsonKey(name: 'tokenOtp')
  final String tokenOtp;

  /// Код подтверждения
  @JsonKey(name: 'code')
  final String code;

  const AuthByCodeVerifyRequestData({
    required this.tokenOtp,
    required this.code,
  });

  factory AuthByCodeVerifyRequestData.fromJson(Map<String, dynamic> json) =>
      _$AuthByCodeVerifyRequestDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$AuthByCodeVerifyRequestDataToJson(this);
}
