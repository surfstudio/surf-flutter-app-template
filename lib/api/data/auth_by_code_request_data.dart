// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: depend_on_referenced_packages, unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos
import 'package:json_annotation/json_annotation.dart';

part 'auth_by_code_request_data.g.dart';

@JsonSerializable(includeIfNull: false)
class AuthByCodeRequestData {
  /// Номер телефона пользователя
  @JsonKey(name: 'phone')
  final String phone;

  const AuthByCodeRequestData({
    required this.phone,
  });

  factory AuthByCodeRequestData.fromJson(Map<String, dynamic> json) =>
      _$AuthByCodeRequestDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$AuthByCodeRequestDataToJson(this);
}
