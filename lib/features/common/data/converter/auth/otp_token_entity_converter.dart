import 'package:flutter_template/api/data/auth_by_code_response_data.dart';
import 'package:flutter_template/features/common/data/converter/converter.dart';
import 'package:flutter_template/features/common/domain/entity/auth/otp_token_entity.dart';

/// Converter for [OtpTokenEntity]
typedef IOtpTokenEntityConverter = Converter<OtpTokenEntity, AuthByCodeResponseData>;

/// {@template otp_token_converter.class}
/// Implementation [IOtpTokenEntityConverter]
/// {@endtemplate}
final class OtpTokenEntityConverter extends IOtpTokenEntityConverter {
  /// {@macro otp_token_converter.class}
  const OtpTokenEntityConverter();

  @override
  OtpTokenEntity convert(AuthByCodeResponseData from) {
    return OtpTokenEntity(
      codeLifetime: Duration(seconds: from.codeLifetime),
      otpToken: from.tokenOtp,
    );
  }
}
