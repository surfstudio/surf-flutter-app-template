// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: depend_on_referenced_packages, unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos

import 'package:json_annotation/json_annotation.dart';

part 'auth_by_code_response_data.g.dart';

@JsonSerializable(includeIfNull: false)
class AuthByCodeResponseData {
  /// Время жизни кода для авторизации в секундах
  @JsonKey(name: 'codeLifetime')
  final int codeLifetime;

  /// OTP-token для аутентификации пользователя
  @JsonKey(name: 'tokenOtp')
  final String tokenOtp;

  const AuthByCodeResponseData({
    required this.codeLifetime,
    required this.tokenOtp,
  });

  factory AuthByCodeResponseData.fromJson(Map<String, dynamic> json) =>
      _$AuthByCodeResponseDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$AuthByCodeResponseDataToJson(this);
}