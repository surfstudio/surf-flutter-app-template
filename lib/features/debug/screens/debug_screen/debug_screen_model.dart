import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/urls.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_widget_model.dart';

// ignore_for_file: avoid_positional_boolean_parameters

/// Model for [DebugScreen].
class DebugScreenModel extends ElementaryModel {
  /// Interface for handle error in business logic.
  final ErrorHandler errorHandler;

  /// Environment configuration.
  final Environment<AppConfig> environment;

  /// Callback to rebuild the whole application.
  final VoidCallback applicationRebuilder;

  /// Config change Notifier.
  late ValueNotifier<AppConfig> configNotifier;

  /// Create an instance [DebugScreenModel].
  DebugScreenModel(
    this.errorHandler,
    this.environment,
    this.applicationRebuilder,
  ) : super(errorHandler: errorHandler);

  @override
  void init() {
    configNotifier = ValueNotifier<AppConfig>(environment.config);
    environment.addListener(_environmentChangedCallback);
  }

  @override
  void dispose() {
    environment.removeListener(_environmentChangedCallback);
  }

  /// Switch server.
  void switchServer(UrlType urlType) {
    AppConfig newConfig;
    switch (urlType) {
      case UrlType.test:
        newConfig = configNotifier.value.copyWith(url: Url.testUrl);
        break;
      case UrlType.prod:
        newConfig = configNotifier.value.copyWith(url: Url.prodUrl);
        break;
      default:
        newConfig = configNotifier.value.copyWith(url: Url.devUrl);
        break;
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
    applicationRebuilder();
  }

  // ignore: use_setters_to_change_properties
  void _setConfig(AppConfig newConfig) {
    environment.config = newConfig;
  }

  void _environmentChangedCallback() {
    configNotifier.value = environment.config;
  }
}
