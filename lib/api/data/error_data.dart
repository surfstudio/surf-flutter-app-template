// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'error_data.g.dart';

@JsonSerializable(includeIfNull: false)
class ErrorData {
  @JsonKey(name: 'code')
  final int code;

  /// Message that will be displayed on the UI, or will be used only to inform developers.
  @JsonKey(name: 'detail')
  final String detail;

  const ErrorData({
    required this.code,
    required this.detail,
  });

  factory ErrorData.fromJson(Map<String, dynamic> json) => _$ErrorDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}
