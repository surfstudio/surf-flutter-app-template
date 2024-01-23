import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_template/api/data/umbrella.dart';
import 'package:flutter_template/api/service/auth/auth_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

/// AuthApi gateway
@RestApi()
abstract class AuthApi {
  /// Creates AuthApi gateway
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  /// Авторизация по коду, получение ОТП кода
  /// Авторизация происходит по номеру телефона с последующим подтверждением.
  @POST(AuthUrls.otp)
  Future<AuthByCodeResponseData> postOtp(
    @Body() AuthByCodeRequestData authByCodeRequest,
  );

  /// Авторизация по коду, подтверждение ОТП кодом
  /// Запрос для подтверждения кода из смс.
  @POST(AuthUrls.verify)
  Future<AuthResponseData> postVerify(
    @Body() AuthByCodeVerifyRequestData authByCodeVerifyRequest,
  );
}
