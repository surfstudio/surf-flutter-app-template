import 'package:dio/dio.dart';
import 'package:flutter_template/config/environment/environment.dart';

/// Базовый класс с настройкой клиента [Dio].
class AppDioConfigurator {
  final Environment _environment;

  /// Дополнительные интерсепторы для Dio.
  Iterable<Interceptor> additionalInterceptors = [];

  /// Инициализация клиента.
  AppDioConfigurator(this._environment);

  /// Создание клиента [Dio].
  Dio create() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = _environment.config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      final proxyUrl = Environment.instance().config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    dio.interceptors.addAll(additionalInterceptors);

    if (Environment.instance().isDebug) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}