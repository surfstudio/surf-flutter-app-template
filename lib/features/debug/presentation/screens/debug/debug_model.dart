import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/theme_service.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';

/// Model for [DebugScreen].
final class DebugScreenModel extends BaseModel {
  final IDebugRepository _debugRepository;
  final AppConfig _appConfig;
  final IThemeService _themeService;

  /// Config change Notifier.
  late ValueNotifier<AppConfig> configNotifier;

  /// Theme mode change Notifier.
  late ValueNotifier<ThemeMode> currentThemeMode;

  /// Config proxy url value.
  String? get proxyUrl => _appConfig.proxyUrl;

  /// Create an instance [DebugScreenModel].
  DebugScreenModel(
    this._debugRepository,
    this._appConfig,
    this._themeService, {
    required super.logWriter,
  });

  @override
  void init() {
    configNotifier = ValueNotifier<AppConfig>(_appConfig);
    currentThemeMode = ValueNotifier<ThemeMode>(_themeService.currentThemeMode);
    _themeService.addListener(_updateTheme);
  }

  @override
  void dispose() {
    _themeService.removeListener(_updateTheme);
  }

  /// Switch server.
  Future<void> switchServer(Url url) async {
    await makeCall(() => _debugRepository.saveUrl(url));
  }

  /// Change proxyUrl value.
  Future<void> setProxy(String proxyUrl) async {
    await makeCall(() => _debugRepository.saveProxyUrl(proxyUrl));
  }

  /// Set theme mode for app.
  void setThemeMode(ThemeMode themeMode) {
    _themeService.updateThemeMode(themeMode);
  }

  void _updateTheme() {
    currentThemeMode.value = _themeService.currentThemeMode;
  }
}
