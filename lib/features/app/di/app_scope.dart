import 'package:analytics/core/analytyc_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/common/service/theme/theme_service.dart';
import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template app_scope.class}
/// Scope of dependencies which are needed through the whole app's life.
/// {@endtemplate}
final class AppScope implements IAppScope {
  final IThemeModeStorage _themeModeStorage;

  @override
  final Environment env;
  @override
  final AppConfig appConfig;
  @override
  final SharedPreferences sharedPreferences;
  @override
  final Dio dio;
  @override
  final IThemeService themeService;
  @override
  final AnalyticService analyticsService;
  @override
  final ILogWriter logger;

  /// {@macro app_scope.class}
  const AppScope({
    required this.env,
    required this.appConfig,
    required this.sharedPreferences,
    required this.dio,
    required this.themeService,
    required this.analyticsService,
    required this.logger,
    required IThemeModeStorage themeModeStorage,
  }) : _themeModeStorage = themeModeStorage;

  @override
  Future<void> init() async {
    await _initTheme();
  }

  Future<void> _initTheme() async {
    themeService.addListener(_onThemeModeChanged);
  }

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: themeService.currentThemeMode);
  }
}

/// {@macro app_scope.class}
abstract interface class IAppScope {
  /// Init app scope. All global initialization should happen here.
  Future<void> init();

  /// Environment.
  Environment get env;

  /// App configuration.
  AppConfig get appConfig;

  /// Http client.
  Dio get dio;

  /// A service that stores and retrieves app theme mode.
  IThemeService get themeService;

  /// Shared preferences.
  SharedPreferences get sharedPreferences;

  /// Logger
  ILogWriter get logger;

  /// Analytics sending service
  AnalyticService get analyticsService;
}
