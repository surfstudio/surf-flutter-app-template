import 'dart:async';
import 'dart:io';
import 'package:analytics/core/analytyc_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/theme_service.dart';
import 'package:flutter_template/common/service/theme/theme_service_impl.dart';
import 'package:flutter_template/common/utils/analytics/firebase/firebase_analytic_strategy.dart';
import 'package:flutter_template/common/utils/analytics/mock/mock_firebase_analytics.dart';
import 'package:flutter_template/common/utils/default_error_handler.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/navigation/service/app_router.dart';
import 'package:flutter_template/persistence/storage/theme_storage/i_theme_storage.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  @override
  late VoidCallback applicationRebuilder;

  static const _themeByDefault = ThemeMode.system;

  final SharedPreferences _sharedPreferences;

  late final Dio _dio;
  late final ErrorHandler _errorHandler;
  late final AppRouter _router;
  late final IThemeService _themeService;
  late final AnalyticService _analyticsService;

  late IThemeStorage _themeModeStorage;

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  @override
  AnalyticService get analyticsService => _analyticsService;

  /// Create an instance [AppScope].
  AppScope(this._sharedPreferences) {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _errorHandler = const DefaultErrorHandler();
    _router = AppRouter.instance();
    _themeModeStorage = ThemeStorage(_sharedPreferences);
    _analyticsService = AnalyticService.withStrategies({
      // TODO(init): can be removed MockFirebaseAnalytics, added for demo analytics track.
      FirebaseAnalyticStrategy(MockFirebaseAnalytics()),
    });
  }

  @override
  Future<void> initTheme() async {
    final theme = await ThemeStorage(_sharedPreferences).getThemeMode() ??
        _themeByDefault;
    _themeService = ThemeServiceImpl(theme);
    _themeService.addListener(_onThemeModeChanged);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dioLocal = Dio();

    dioLocal.options
      ..baseUrl = Environment.instance().config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dioLocal.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
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

    dioLocal.interceptors.addAll(additionalInterceptors);

    if (Environment.instance().isDebug) {
      dioLocal.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dioLocal;
  }

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: _themeService.currentThemeMode);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// A service that stores and retrieves app theme mode.
  IThemeService get themeService;

  /// Shared preferences.
  SharedPreferences get sharedPreferences;

  /// Analytics sending service.
  AnalyticService get analyticsService;

  /// Init theme service with theme from storage or default value.
  Future<void> initTheme();
}
