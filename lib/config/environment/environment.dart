import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/common/service/log_history/log_history_service_impl.dart';
import 'package:flutter_template/common/utils/logger/log_history.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/build_type.dart';
import 'package:flutter_template/persistence/storage/config_storage/i_config_settings_storage.dart';
import 'package:logger/logger.dart';
import 'package:surf_logger/surf_logger.dart' as surf;

/// Environment configuration.
class Environment implements Listenable {
  /// Firebase options for initialize.
  final FirebaseOptions? firebaseOptions;
  final BuildType _currentBuildType;

  ValueNotifier<AppConfig> _config;

  static Environment? _instance;

  /// Configuration.
  AppConfig get config => _config.value;

  /// Is this application running in debug mode.
  bool get isDebug => _currentBuildType == BuildType.debug;

  /// Is this application running in release mode.
  bool get isRelease => _currentBuildType == BuildType.release;

  /// App build type.
  BuildType get buildType => _currentBuildType;

  set config(AppConfig c) => _config.value = c;

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

  /// Add strategy to logger for save logs history for qa environment.
  Future<void> createLogHistoryStrategy() async {
    if (_currentBuildType != BuildType.qa) return;

    if (_currentBuildType == BuildType.qa) {
      final file = await const LogHistoryServiceImpl().logHistoryFile();
      final logger = Logger(
        printer: PrettyPrinter(lineLength: 80, noBoxingByDefault: true),
        output: FileCustomOutput(file: file),
      );

      surf.Logger.addStrategy(LogHistoryStrategy(logger));
    }
  }

  /// Save config proxy url to storage.
  Future<void> saveConfigProxy(IConfigSettingsStorage storage) {
    final config = this.config;

    return storage.setProxyUrl(proxy: config.proxyUrl ?? '');
  }
}
