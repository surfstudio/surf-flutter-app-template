// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'tokens_data.g.dart';

@JsonSerializable(includeIfNull: false)
class TokensData {
  /// Access-token для доступа к ресурсам сервера для авторизованного пользователя
  @JsonKey(name: 'accessToken')
  final String accessToken;

  /// Refresh-token для обновление access-токена
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  const TokensData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokensData.fromJson(Map<String, dynamic> json) => _$TokensDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$TokensDataToJson(this);
}
