import 'package:analytics/core/analytyc_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template app_scope.class}
/// Scope of dependencies which are needed through the whole app's life.
/// {@endtemplate}
final class AppScope implements IAppScope {
  @override
  final Environment env;
  @override
  final AppConfig appConfig;
  @override
  final SharedPreferences sharedPreferences;
  @override
  final Dio dio;

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
    required this.analyticsService,
    required this.logger,
  });
}

/// {@macro app_scope.class}
abstract interface class IAppScope {
  /// Environment.
  Environment get env;

  /// App configuration.
  AppConfig get appConfig;

  /// Http client.
  Dio get dio;

  /// Shared preferences.
  SharedPreferences get sharedPreferences;

  /// Logger.
  ILogWriter get logger;

  /// Analytics sending service.
  AnalyticService get analyticsService;
}
