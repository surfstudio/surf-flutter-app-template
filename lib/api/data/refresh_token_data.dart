// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: depend_on_referenced_packages, unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos

import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_data.g.dart';

@JsonSerializable(includeIfNull: false)
class RefreshTokenData {
  /// По refresh токену сервер должен обновить пару токенов и вернуть их в ответе
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  const RefreshTokenData({
    required this.refreshToken,
  });

  factory RefreshTokenData.fromJson(Map<String, dynamic> json) => _$RefreshTokenDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$RefreshTokenDataToJson(this);
}
