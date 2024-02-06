import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';

/// {@template api_failure.class}
/// API error.
/// {@endtemplate}
base class ApiFailure extends Failure<DioException> {
  /// Error status code.
  /// It can be either original from [DioException], or a special one parsed from the response body.
  /// Special status codes are described below and are checked through getters.
  final int? statusCode;

  /// Message
  final String? message;

  /// {@macro api_failure.class}
  const ApiFailure({
    required super.original,
    required super.trace,
    this.statusCode,
    this.message,
  });

  // TODO(anyone): add getters for special status codes
  /// Sample: ExpiredToken - refresh token has expired
  // bool get isExpiredRefreshToken => statusCode == 102;
}

/// {@template timeout_failure.class}
/// TimeoutException
/// {@endtemplate}
final class TimeoutFailure extends ApiFailure {
  /// {@macro timeout_failure.class}
  const TimeoutFailure({
    required super.original,
    required super.trace,
    super.statusCode,
    super.message,
  });
}
