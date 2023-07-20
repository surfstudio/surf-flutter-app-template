import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/common/service/theme/theme_service.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_widget_model.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// Model for [DebugScreen].
class DebugScreenModel extends ElementaryModel {
  /// Interface for handle error in business logic.
  final ErrorHandler errorHandler;

  /// Environment configuration.
  final Environment _environment;

  final IThemeService _themeService;

  /// Callback to rebuild the whole application.
  final VoidCallback _applicationRebuilder;

  final IConfigSettingsStorage _configSettingsStorage;

  /// Config change Notifier.
  late ValueNotifier<AppConfig> configNotifier;

  /// Theme mode change Notifier.
  late ValueNotifier<ThemeMode> currentThemeMode;

  /// Config proxy url value.
  String? get proxyUrl => _environment.config.proxyUrl;

  /// Create an instance [DebugScreenModel].
  DebugScreenModel(
    this.errorHandler,
    this._environment,
    this._applicationRebuilder,
    this._configSettingsStorage,
    this._themeService,
  ) : super(errorHandler: errorHandler);

  @override
  void init() {
    configNotifier = ValueNotifier<AppConfig>(_environment.config);
    currentThemeMode = ValueNotifier<ThemeMode>(_themeService.currentThemeMode);
    _themeService.addListener(_updateTheme);
    _environment.addListener(_environmentChangedCallback);
  }

  @override
  void dispose() {
    _environment.removeListener(_environmentChangedCallback);
    _themeService.removeListener(_updateTheme);
  }

  /// Switch server.
  void switchServer(UrlType urlType) {
    AppConfig newConfig;
    switch (urlType) {
      case UrlType.test:
        newConfig = configNotifier.value.copyWith(url: Url.testUrl);
      case UrlType.prod:
        newConfig = configNotifier.value.copyWith(url: Url.prodUrl);
      default:
        newConfig = configNotifier.value.copyWith(url: Url.devUrl);
    }
    _refreshApp(newConfig);
  }

  /// Change proxyUrl value.
  void setProxy(String? proxyUrl) {
    _refreshApp(
      configNotifier.value.copyWith(proxyUrl: proxyUrl),
    );
  }

  /// Set theme mode for app.
  void setThemeMode(ThemeMode themeMode) {
    _themeService.updateThemeMode(themeMode);
  }

  void _refreshApp(AppConfig newConfig) {
    _setConfig(newConfig);
    _applicationRebuilder();
  }

  // ignore: use_setters_to_change_properties
  Future<void> _setConfig(AppConfig newConfig) async {
    _environment.config = newConfig;
    await _environment.saveConfigProxy(_configSettingsStorage);
  }

  void _environmentChangedCallback() {
    configNotifier.value = _environment.config;
  }

  void _updateTheme() {
    currentThemeMode.value = _themeService.currentThemeMode;
  }
}
