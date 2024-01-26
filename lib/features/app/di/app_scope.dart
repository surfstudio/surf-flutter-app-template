import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/api/data/tokens_data.dart';
import 'package:flutter_template/api/service/auth/auth_api.dart';
import 'package:flutter_template/api/service/common/common_api.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/common/data/converter/auth/auth_by_code_request_data_converter.dart';
import 'package:flutter_template/features/common/data/converter/auth/auth_by_code_verify_request_data_converter.dart';
import 'package:flutter_template/features/common/data/converter/auth/otp_token_entity_converter.dart';
import 'package:flutter_template/features/common/data/converter/user/user_profile_entity_converter.dart';
import 'package:flutter_template/features/common/data/repository/auth_repository.dart';
import 'package:flutter_template/features/common/domain/repository/auth_repository.dart';
import 'package:flutter_template/features/common/interceptors/auth_interceptor.dart';
import 'package:flutter_template/features/common/service/error_reports/error_reports_service.dart';
import 'package:flutter_template/features/common/service/error_reports/i_error_reports_service.dart';
import 'package:flutter_template/features/common/service/theme/theme_service.dart';
import 'package:flutter_template/features/common/service/theme/theme_service_impl.dart';
import 'package:flutter_template/features/common/service/token_operations/i_token_operations_service.dart';
import 'package:flutter_template/features/common/service/token_operations/token_operations_dio_service.dart';
import 'package:flutter_template/features/common/utils/analytics/amplitude/amplitude_analytic_tracker.dart';
import 'package:flutter_template/features/common/utils/analytics/firebase/firebase_analytic_tracker.dart';
import 'package:flutter_template/features/common/utils/analytics/mock/mock_amplitude_analytics.dart';
import 'package:flutter_template/features/common/utils/analytics/mock/mock_firebase_analytics.dart';
import 'package:flutter_template/features/common/utils/analytics/service/analytics_service.dart';
import 'package:flutter_template/features/common/utils/analytics/service/analytics_service_impl.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/persistence/storage/first_run/first_run_storage.dart';
import 'package:flutter_template/persistence/storage/first_run/i_first_run_storage.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage_impl.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/i_tokens_storage.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/tokens_storage.dart';
import 'package:flutter_template/util/default_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  static const _themeByDefault = ThemeMode.system;

  final SharedPreferences _sharedPreferences;

  late final Dio _dio;
  late final Dio _authDio;
  late final Dio _logoutDio;
  late final ErrorHandler _errorHandler;
  late final AppRouter _router;
  late final IThemeService _themeService;
  late final IAnalyticsService _analyticsService;
  late final IErrorReportsService _errorReportsService;
  late final ITokenOperationsService<TokensData, DioException> _tokenOperationsService;
  late final IThemeModeStorage _themeModeStorage;
  late final FlutterSecureStorage _secureStorage;
  late final ITokensStorage _tokensStorage;
  late final IFirstRunStorage _firstRunStorage;
  late final IAuthRepository _authRepository;

  @override
  late VoidCallback applicationRebuilder;

  @override
  Dio get dio => _dio;

  @override
  Dio get authDio => _authDio;

  @override
  Dio get logoutDio => _logoutDio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  @override
  IAnalyticsService get analyticsService => _analyticsService;

  @override
  FlutterSecureStorage get secureStorage => _secureStorage;

  @override
  ITokensStorage get tokensStorage => _tokensStorage;

  @override
  IFirstRunStorage get firstRunStorage => _firstRunStorage;

  @override
  IAuthRepository get authRepository => _authRepository;

  @override
  IErrorReportsService get errorReportsService => _errorReportsService;

  /// Create an instance [AppScope].
  AppScope(this._sharedPreferences) {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();
    _secureStorage = const FlutterSecureStorage();
    _tokensStorage = TokensStorage(_secureStorage);
    _firstRunStorage = FirstRunStorage(_sharedPreferences);
    _themeModeStorage = ThemeModeStorageImpl(_sharedPreferences);
    _analyticsService = AnalyticsServiceImpl([
      // TODO(init): can be removed MockFirebaseAnalytics and MockAmplitudeAnalytics, added for demo analytics track
      FirebaseAnalyticTracker(MockFirebaseAnalytics()),
      AmplitudeAnalyticTracker(MockAmplitudeAnalytics()),
    ]);

    _errorReportsService = const ErrorReportsService();
    _tokenOperationsService = TokenOperationsDioService(
      commonApi: CommonApi(_dio),
      tokensStorage: _tokensStorage,
      errorReportsService: _errorReportsService,
    );

    _logoutDio = _initDio([
      AuthInterceptor(
        dio: _dio,
        tokenOperationsService: _tokenOperationsService,
        errorReportsService: _errorReportsService,
        // ignore: no-empty-block
        onLogout: () {},
      ),
    ]);

    _authRepository = AuthRepository(
      authApi: AuthApi(_dio),
      commonApi: CommonApi(_logoutDio),
      tokensStorage: _tokensStorage,
      errorReportsService: _errorReportsService,
      authByCodeRequestDataConverter: const AuthByCodeRequestDataConverter(),
      otpTokenEntityConverter: const OtpTokenEntityConverter(),
      authByCodeVerifyRequestDataConverter: const AuthByCodeVerifyRequestDataConverter(),
      userProfileEntityConverter: const UserProfileEntityConverter(),
      firstRunStorage: _firstRunStorage,
    );

    _authDio = _initDio([
      AuthInterceptor(
        dio: _dio,
        tokenOperationsService: _tokenOperationsService,
        errorReportsService: _errorReportsService,
        onLogout: _authRepository.logout,
      ),
    ]);
  }

  @override
  Future<void> init() async {
    await _initTheme();
    await _initAuthRepository();
  }

  @override
  void dispose() {
    _authRepository.dispose();
  }

  Future<void> _initTheme() async {
    final theme = await ThemeModeStorageImpl(_sharedPreferences).getThemeMode() ?? _themeByDefault;
    _themeService = ThemeServiceImpl(theme);
    _themeService.addListener(_onThemeModeChanged);
  }

  Future<void> _initAuthRepository() async {
    await _authRepository.init();
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

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: _themeService.currentThemeMode);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Http client for authorized requests.
  Dio get authDio;

  /// Http client for requests before logout.
  /// It is authorized, but ignores error if token refresh fails.
  Dio get logoutDio;

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

  /// Analytics sending service
  IAnalyticsService get analyticsService;

  /// Tokens storage.
  ITokensStorage get tokensStorage;

  /// Secure storage.
  FlutterSecureStorage get secureStorage;

  /// First Run storage.
  IFirstRunStorage get firstRunStorage;

  /// Auth repository
  IAuthRepository get authRepository;

  /// Interface for error reports
  IErrorReportsService get errorReportsService;

  /// Initialize dependencies
  Future<void> init();

  /// Dispose resources
  void dispose();
}
