import 'package:flutter_template/api/data/auth_by_code_verify_request_data.dart';
import 'package:flutter_template/features/common/data/converter/converter.dart';

/// Converter for [AuthByCodeVerifyRequestData]
typedef IAuthByCodeVerifyRequestDataConverter
    = Converter<AuthByCodeVerifyRequestData, (String, String)>;

/// {@template auth_by_code_verify_request_data_converter.class}
/// Implementation [IAuthByCodeVerifyRequestDataConverter]
/// {@endtemplate}
final class AuthByCodeVerifyRequestDataConverter extends IAuthByCodeVerifyRequestDataConverter {
  /// {@macro auth_by_code_verify_request_data_converter.class}
  const AuthByCodeVerifyRequestDataConverter();

  @override
  AuthByCodeVerifyRequestData convert((String, String) from) {
    return AuthByCodeVerifyRequestData(tokenOtp: from.$1, code: from.$2);
  }
}
