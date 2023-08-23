import 'package:json_annotation/json_annotation.dart';

part 'server_error_response.g.dart';

/// Expected server error model.
@JsonSerializable()
class ServerErrorResponse {
  /// Error type.
  ///
  /// Example format: `400001`
  final String? type;

  /// Status code.
  ///
  /// Examples: `400`, `403`, `500`.
  final int status;

  /// Error message.
  final String? title;

  /// Error details.
  final String? detail;

  /// Base constructor.
  ServerErrorResponse(this.type, this.status, this.title, this.detail);

  /// @nodoc
  factory ServerErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorResponseFromJson(json);

  /// @nodoc
  Map<String, dynamic> toJson() => _$ServerErrorResponseToJson(this);
}
