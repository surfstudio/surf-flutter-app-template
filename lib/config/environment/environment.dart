import 'package:flutter/foundation.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/build_types.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';

/// Environment configuration.
class Environment<T> implements Listenable {
  static Environment? _instance;
  final BuildType _currentBuildType;

  /// Configuration.
  T get config => _config.value;

  set config(T c) => _config.value = c;

  /// Is this application running in debug mode.
  bool get isDebug => _currentBuildType == BuildType.debug;

  /// Is this application running in release mode.
  bool get isRelease => _currentBuildType == BuildType.release;

  /// App build type.
  BuildType get buildType => _currentBuildType;

  ValueNotifier<T> _config;

  Environment._(this._currentBuildType, T config)
      : _config = ValueNotifier<T>(config);

  /// Provides instance [Environment].
  factory Environment.instance() => _instance as Environment<T>;

  @override
  void addListener(VoidCallback listener) {
    _config.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _config.removeListener(listener);
  }

  /// Initializing the environment.
  static void init<T>({
    required BuildType buildType,
    required T config,
  }) {
    _instance ??= Environment<T>._(buildType, config);
  }

  /// Update config proxy url from storage
  Future<void> refreshConfigProxy(IConfigSettingsStorage storage) async {
    final savedProxy = await storage.getProxyUrl();
    if (savedProxy?.isNotEmpty ?? false) {
      config = (config as AppConfig).copyWith(proxyUrl: savedProxy) as T;
    }
  }

  /// Save config proxy url to storage
  Future<void> saveConfigProxy(IConfigSettingsStorage storage) {
    final config = this.config;
    if (config is! AppConfig) {
      throw Exception('Unsupported config type for proxy');
    }
    return storage.setProxyUrl(proxy: config.proxyUrl ?? '');
  }
}
