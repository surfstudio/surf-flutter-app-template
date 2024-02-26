import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/i_theme_service.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';
import 'package:flutter_template/persistence/storage/config_storage/i_config_settings_storage.dart';

/// Model for [DebugScreen].
final class DebugModel extends ElementaryModel {
  /// Interface for handle error in business logic.
  final ErrorHandler errorHandler;

  /// Config change Notifier.
  late ValueNotifier<AppConfig> configNotifier;

  /// Theme mode change Notifier.
  late ValueNotifier<ThemeMode> currentThemeMode;

  /// Environment configuration.
  final Environment _environment;

  final IThemeService _themeService;

  /// Callback to rebuild the whole application.
  final VoidCallback _onApplicationRebuilder;

  final IConfigSettingsStorage _configSettingsStorage;

  /// Config proxy url value.
  String? get proxyUrl => _environment.config.proxyUrl;

  /// Create an instance [DebugModel].
  DebugModel(
    this.errorHandler,
    this._environment,
    this._onApplicationRebuilder,
    this._configSettingsStorage,
    this._themeService,
  ) : super(errorHandler: errorHandler);

  @override
  void dispose() {
    _environment.removeListener(_environmentChangedCallback);
    _themeService.removeListener(_updateTheme);
  }

  @override
  void init() {
    configNotifier = ValueNotifier<AppConfig>(_environment.config);
    currentThemeMode = ValueNotifier<ThemeMode>(_themeService.currentThemeMode);
    _themeService.addListener(_updateTheme);
    _environment.addListener(_environmentChangedCallback);
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
  void setProxy(String? url) {
    _refreshApp(
      configNotifier.value.copyWith(proxyUrl: url),
    );
  }

  /// Set theme mode for app.
  void setThemeMode(ThemeMode themeMode) {
    _themeService.updateThemeMode(themeMode);
  }

  void _refreshApp(AppConfig newConfig) {
    unawaited(_setConfig(newConfig));
    _onApplicationRebuilder();
  }

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
