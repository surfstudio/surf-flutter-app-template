import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';

/// {@template api_failure.class}
/// API error.
/// {@endtemplate}
base class ApiFailure extends Failure<DioError> {
  /// Error status code.
  /// It can be either original from [DioError], or a special one parsed from the response body.
  /// Special status codes are described below and are checked through getters.
  final int? statusCode;

  /// Сообщение
  final String? message;

  /// {@macro api_failure.class}
  const ApiFailure({
    required super.original,
    this.statusCode,
    this.message,
    super.trace,
  });

  /// UserBlocked - user was blocked
  bool get isUserBlocked => statusCode == 101;

  /// ExpiredToken - refresh token has expired
  bool get isExpiredRefreshToken => statusCode == 102;

  /// OTPCodeRequestsTooMany - too frequent requests for OTP code generation
  bool get isOTPCodeRequestsTooMany => statusCode == 103;

  /// OTPCodeInvalid - invalid OTP code
  bool get isOTPCodeInvalid => statusCode == 104;

  /// SendingCodeFailed - failed to send OTP code
  bool get isSendingCodeFailed => statusCode == 105;

  /// OTPCodeExpired - OTP code lifetime has expired
  bool get isOTPCodeExpired => statusCode == 113;
}

/// {@template timeout_failure.class}
/// TimeoutException
/// {@endtemplate}
final class TimeoutFailure extends ApiFailure {
  /// {@macro timeout_failure.class}
  const TimeoutFailure({
    required super.original,
    super.statusCode,
    super.message,
    super.trace,
  });
}
