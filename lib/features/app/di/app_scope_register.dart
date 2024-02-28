import 'dart:io';

import 'package:analytics/core/analytyc_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/theme_service_impl.dart';
import 'package:flutter_template/common/utils/analytics/firebase/firebase_analytic_strategy.dart';
import 'package:flutter_template/common/utils/analytics/mock/mock_firebase_analytics.dart';
import 'package:flutter_template/common/utils/logger/log_writer.dart';
import 'package:flutter_template/common/utils/logger/strategies/debug_log_strategy.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/data/converters/url_converter.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage_impl.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage_impl.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_logger/surf_logger.dart' as surf_logger;

/// {@template app_scope_register.class}
/// Creates and initializes AppScope
/// {@endtemplate}
final class AppScopeRegister {
  /// {@macro app_scope_register.class}
  const AppScopeRegister();

  /// Create scope
  Future<IAppScope> createScope(Environment env) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final appConfig = await _createAppConfig(env, sharedPreferences);

    final interceptors = <Interceptor>[];
    final dio = _createDio(
      interceptors: interceptors,
      url: appConfig.url.value,
      proxyUrl: appConfig.proxyUrl,
    );

    final themeModeStorage = ThemeModeStorageImpl(sharedPreferences);
    final theme = await themeModeStorage.getThemeMode() ?? ThemeMode.system;
    final themeService = ThemeServiceImpl(theme);

    final analyticsService = AnalyticService.withStrategies({
      // TODO(init): can be removed MockFirebaseAnalytics, added for demo analytics track
      FirebaseAnalyticStrategy(MockFirebaseAnalytics()),
    });

    final surfLogger = surf_logger.Logger.withStrategies({
      if (!kReleaseMode) DebugLogStrategy(Logger(printer: PrettyPrinter(methodCount: 0))),
      // TODO(init-project): Initialize CrashlyticsLogStrategy.
      // CrashlyticsLogStrategy(),
    });
    final logger = LogWriter(surfLogger);

    return AppScope(
      env: env,
      appConfig: appConfig,
      sharedPreferences: sharedPreferences,
      dio: dio,
      analyticsService: analyticsService,
      logger: logger,
      themeModeStorage: themeModeStorage,
      themeService: themeService,
    );
  }

  Future<AppConfig> _createAppConfig(Environment env, SharedPreferences prefs) async {
    if (env.isProd && kReleaseMode) {
      return AppConfig(url: env.buildType.defaultUrl);
    }

    final savedUrl = await _url(prefs);
    final savedProxyUrl = await _proxyUrl(env, prefs);

    return AppConfig(
      url: savedUrl ?? env.buildType.defaultUrl,
      proxyUrl: savedProxyUrl,
    );
  }

  Future<Url?> _url(SharedPreferences prefs) async {
    const urlTypeConverter = UrlConverter();
    final configStorage = ConfigStorageImpl(prefs);

    final rawUrl = await configStorage.getUrlType();
    final savedUrl = urlTypeConverter.converter.convertNullable(rawUrl);

    return savedUrl;
  }

  Future<String?> _proxyUrl(Environment env, SharedPreferences prefs) async {
    final configStorage = ConfigStorageImpl(prefs);
    return configStorage.getProxyUrl();
  }

  Dio _createDio({
    required Iterable<Interceptor> interceptors,
    required String url,
    String? proxyUrl,
  }) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
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

    dio.interceptors.addAll(interceptors);

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
