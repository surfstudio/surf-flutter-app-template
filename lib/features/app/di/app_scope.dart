import 'package:analytics/core/analytyc_service.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter_template/common/service/theme/theme_service.dart';
import 'package:flutter_template/persistence/storage/theme_storage/theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_logger/surf_logger.dart' as surf_logger;

/// {@template app_scope.class}
/// Scope of dependencies which are needed through the whole app's life.
/// {@endtemplate}
final class AppScope implements IAppScope {
  final IThemeModeStorage _themeModeStorage;

  @override
  final SharedPreferences sharedPreferences;
  @override
  final Dio dio;
  @override
  final ErrorHandler errorHandler;
  @override
  final IThemeService themeService;
  @override
  final AnalyticService analyticsService;
  @override
  final surf_logger.LogWriter logger;

  /// {@macro app_scope.class}
  const AppScope({
    required this.sharedPreferences,
    required this.dio,
    required this.errorHandler,
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

  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// A service that stores and retrieves app theme mode.
  IThemeService get themeService;

  /// Shared preferences.
  SharedPreferences get sharedPreferences;

  /// Surf Logger
  surf_logger.LogWriter get logger;

  /// Analytics sending service
  AnalyticService get analyticsService;
}
