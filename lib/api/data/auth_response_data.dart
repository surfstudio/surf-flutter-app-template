// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_data.g.dart';

@JsonSerializable(includeIfNull: false)
class AuthResponseData {
  @JsonKey(name: 'tokens')
  final TokensData tokens;

  @JsonKey(name: 'user')
  final UserProfileData user;

  const AuthResponseData({
    required this.tokens,
    required this.user,
  });

  factory AuthResponseData.fromJson(Map<String, dynamic> json) => _$AuthResponseDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$AuthResponseDataToJson(this);
}
