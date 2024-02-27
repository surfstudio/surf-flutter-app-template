import 'dart:io';

import 'package:analytics/core/analytyc_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/theme_service_impl.dart';
import 'package:flutter_template/common/utils/analytics/firebase/firebase_analytic_strategy.dart';
import 'package:flutter_template/common/utils/analytics/mock/mock_firebase_analytics.dart';
import 'package:flutter_template/common/utils/default_error_handler.dart';
import 'package:flutter_template/common/utils/logger/debug_log_strategy.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
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
  Future<IAppScope> createScope() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];
    final dio = _createDio(additionalInterceptors);
    final errorHandler = DefaultErrorHandler();

    final themeModeStorage = ThemeModeStorageImpl(sharedPreferences);
    final theme = await themeModeStorage.getThemeMode() ?? ThemeMode.system;
    final themeService = ThemeServiceImpl(theme);

    final analyticsService = AnalyticService.withStrategies({
      // TODO(init): can be removed MockFirebaseAnalytics, added for demo analytics track
      FirebaseAnalyticStrategy(MockFirebaseAnalytics()),
    });

    final logger = surf_logger.Logger.withStrategies({
      if (!kReleaseMode) DebugLogStrategy(Logger(printer: PrettyPrinter(methodCount: 0))),
      // TODO(init-project): Initialize CrashlyticsLogStrategy.
      // CrashlyticsLogStrategy(),
    });

    return AppScope(
      sharedPreferences: sharedPreferences,
      dio: dio,
      errorHandler: errorHandler,
      analyticsService: analyticsService,
      logger: logger,
      themeModeStorage: themeModeStorage,
      themeService: themeService,
    );
  }

  Dio _createDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment.instance().config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
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
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
