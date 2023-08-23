import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/common/service/interceptors/auth_token_interceptor.dart';
import 'package:flutter_template/features/common/service/interceptors/refresh_token_interceptor.dart';
import 'package:flutter_template/features/common/service/interceptors/retry_interceptor.dart';
import 'package:flutter_template/features/common/service/repository/refresh_token/refresh_token_impl.dart';
import 'package:flutter_template/features/common/service/repository/refresh_token/refresh_token_repository.dart';
import 'package:flutter_template/features/common/service/theme/theme_service.dart';
import 'package:flutter_template/features/common/service/theme/theme_service_impl.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/persistence/storage/auth_tokens/auth_tokens_storage.dart';
import 'package:flutter_template/persistence/storage/auth_tokens/auth_tokens_storage_secure.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage_impl.dart';
import 'package:flutter_template/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  static const _themeByDefault = ThemeMode.system;

  late final Dio _dio;
  late final ErrorHandler _errorHandler;
  late final AppRouter _router;
  late final IThemeService _themeService;

  @override
  late VoidCallback applicationRebuilder;

  @override
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  late final IAuthTokensStorage authTokensStorage = AuthTokensStorageSecure(secureStorage);

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  late IThemeModeStorage _themeModeStorage;

  /// Create an instance [AppScope].
  AppScope() {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[
      AuthTokenInterceptor(authTokensStorage),
      RefreshTokenInterceptor(
        refreshTokenRepository,
        dio,
      ),
      RetryInterceptor(dio),
    ];

    _dio = _initDio(additionalInterceptors);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();
    _themeModeStorage = ThemeModeStorageImpl();
  }

  @override
  Future<void> initTheme() async {
    final theme = await ThemeModeStorageImpl().getThemeMode() ?? _themeByDefault;
    _themeService = ThemeServiceImpl(theme);
    _themeService.addListener(_onThemeModeChanged);
  }

  @override
  late final IRefreshTokenRepository refreshTokenRepository =
      RefreshTokenRepositoryImpl(authTokensStorage);

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment.instance().config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
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

  /// Init theme service with theme from storage or default value.
  Future<void> initTheme();

  // --- Repository ---

  /// Repository for token refresh operation.
  IRefreshTokenRepository get refreshTokenRepository;

  // --- Storage ---

  /// Storing data in secure storage
  FlutterSecureStorage get secureStorage;

  /// Storage for authentication tokens of the application
  IAuthTokensStorage get authTokensStorage;
}
