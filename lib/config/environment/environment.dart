import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/build_types.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';

/// Environment configuration.
class Environment implements Listenable {
  static Environment? _instance;

  /// Firebase options for initialize.
  final FirebaseOptions? firebaseOptions;
  final BuildType _currentBuildType;

  /// Configuration.
  AppConfig get config => _config.value;

  set config(AppConfig c) => _config.value = c;

  /// Is this application running in debug mode.
  bool get isDebug => _currentBuildType == BuildType.debug;

  /// Is this application running in release mode.
  bool get isRelease => _currentBuildType == BuildType.release;

  /// Is this application running in qa mode.
  bool get isQa => _currentBuildType == BuildType.qa;

  /// App build type.
  BuildType get buildType => _currentBuildType;

  ValueNotifier<AppConfig> _config;

  Environment._(
    this._currentBuildType,
    AppConfig config,
    this.firebaseOptions,
  ) : _config = ValueNotifier<AppConfig>(config);

  /// Provides instance [Environment].
  factory Environment.instance() => _instance!;

  @override
  void addListener(VoidCallback listener) {
    _config.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _config.removeListener(listener);
  }

  /// Initializing the environment.
  static void init({
    required BuildType buildType,
    required AppConfig config,
    FirebaseOptions? firebaseOptions,
  }) {
    _instance ??= Environment._(
      buildType,
      config,
      firebaseOptions,
    );
  }

  /// Update config proxy url from storage.
  Future<void> refreshConfigProxy(IConfigSettingsStorage storage) async {
    final savedProxy = await storage.getProxyUrl();
    if (savedProxy?.isNotEmpty ?? false) {
      config = config.copyWith(proxyUrl: savedProxy);
    }
  }

  /// Save config proxy url to storage.
  Future<void> saveConfigProxy(IConfigSettingsStorage storage) {
    final config = this.config;
    return storage.setProxyUrl(proxy: config.proxyUrl ?? '');
  }
}
