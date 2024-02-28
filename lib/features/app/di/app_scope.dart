import 'dart:io';

import 'package:analytics/core/analytyc_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/common/utils/analytics/firebase/firebase_analytic_strategy.dart';
import 'package:flutter_template/common/utils/analytics/mock/mock_firebase_analytics.dart';
import 'package:flutter_template/common/utils/default_error_handler.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/common/utils/logger/debug_log_strategy.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_logger/surf_logger.dart' as surf_logger;

/// Scope of dependencies which need through all app's life.
final class AppScope implements IAppScope {
  final SharedPreferences _sharedPreferences;

  late final Dio _dio;
  late final ErrorHandler _errorHandler;
  late final AppRouter _router;
  late final AnalyticService _analyticsService;

  Logger? _debugLogPrinter;
  late final surf_logger.LogWriter _logger;

  @override
  late VoidCallback applicationRebuilder;

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  @override
  AnalyticService get analyticsService => _analyticsService;

  @override
  surf_logger.LogWriter get logger => _logger;

  /// Create an instance [AppScope].
  AppScope(this._sharedPreferences) {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();
    _analyticsService = AnalyticService.withStrategies({
      // TODO(init): can be removed MockFirebaseAnalytics, added for demo analytics track
      FirebaseAnalyticStrategy(MockFirebaseAnalytics()),
    });
  }

  @override
  Future<void> init() async {
    await _initLogger();
  }

  @override
  void dispose() {
    _disposeLogger();
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
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

  Future<void> _initLogger() async {
    _logger = surf_logger.Logger.withStrategies({
      if (!kReleaseMode) DebugLogStrategy(_debugLogPrinter = Logger(printer: PrettyPrinter(methodCount: 0))),
      // TODO(init-project): Initialize CrashlyticsLogStrategy.
      // CrashlyticsLogStrategy(),
    });
  }

  Future<void> _disposeLogger() async {
    _debugLogPrinter?.close();
  }
}

/// App dependencies.
abstract interface class IAppScope implements IDisposableObject {
  /// Init app scope
  Future<void> init();

  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// Shared preferences.
  SharedPreferences get sharedPreferences;

  /// Surf Logger
  surf_logger.LogWriter get logger;

  /// Analytics sending service
  AnalyticService get analyticsService;
}
