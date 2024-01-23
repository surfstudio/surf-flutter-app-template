import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_token_entity.freezed.dart';

/// {@template otp_token_entity.class}
/// Otp-token entity
/// {@endtemplate}
@freezed
class OtpTokenEntity with _$OtpTokenEntity {
  /// {@macro otp_token_entity.class}
  const factory OtpTokenEntity({
    /// Authorization code lifetime in seconds
    required Duration codeLifetime,

    /// OTP token for user authentication
    required String otpToken,
  }) = _OtpTokenEntity;
}
