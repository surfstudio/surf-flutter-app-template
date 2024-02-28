import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';

/// Model for [DebugScreen].
final class DebugScreenModel extends ElementaryModel {
  /// Interface for handle error in business logic.
  final ErrorHandler errorHandler;

  /// Environment configuration.
  final Environment _environment;

  /// Callback to rebuild the whole application.
  final VoidCallback _applicationRebuilder;

  final IConfigSettingsStorage _configSettingsStorage;

  /// Config change Notifier.
  late ValueNotifier<AppConfig> configNotifier;

  /// Config proxy url value.
  String? get proxyUrl => _environment.config.proxyUrl;

  /// Create an instance [DebugScreenModel].
  DebugScreenModel(
    this.errorHandler,
    this._environment,
    this._applicationRebuilder,
    this._configSettingsStorage,
  ) : super(errorHandler: errorHandler);

  @override
  void init() {
    configNotifier = ValueNotifier<AppConfig>(_environment.config);
    _environment.addListener(_environmentChangedCallback);
  }

  @override
  void dispose() {
    _environment.removeListener(_environmentChangedCallback);
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

}
