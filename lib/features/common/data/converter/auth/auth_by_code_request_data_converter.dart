import 'package:flutter_template/api/data/auth_by_code_request_data.dart';
import 'package:flutter_template/features/common/data/converter/converter.dart';

/// Converter for [AuthByCodeRequestData]
typedef IAuthByCodeRequestDataConverter = Converter<AuthByCodeRequestData, String>;

/// {@template auth_by_code_request_data_converter.class}
/// Implementation [IAuthByCodeRequestDataConverter]
/// {@endtemplate}
final class AuthByCodeRequestDataConverter extends IAuthByCodeRequestDataConverter {
  /// {@macro auth_by_code_request_data_converter.class}
  const AuthByCodeRequestDataConverter();

  @override
  AuthByCodeRequestData convert(String from) {
    return AuthByCodeRequestData(phone: from);
  }
}
