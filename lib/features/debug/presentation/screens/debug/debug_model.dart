import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';

/// Model for [DebugScreen].
final class DebugScreenModel extends BaseModel {
  final IDebugRepository _debugRepository;
  final AppConfig _appConfig;

  /// Create an instance [DebugScreenModel].
  DebugScreenModel({
    required IDebugRepository debugRepository,
    required AppConfig appConfig,
    required super.logWriter,
  })  : _debugRepository = debugRepository,
        _appConfig = appConfig;

  late final ValueNotifier<Url> _serverUrlState;
  late final ValueNotifier<String?> _proxyUrlState;

  /// Current server url state.
  ValueListenable<Url> get serverUrlState => _serverUrlState;

  /// Current proxy url state.
  ValueListenable<String?> get proxyUrlState => _proxyUrlState;

  @override
  void init() {
    _serverUrlState = ValueNotifier(_appConfig.url);
    _proxyUrlState = ValueNotifier(_appConfig.proxyUrl);
  }

  /// Switch server.
  Future<void> switchServer(Url url) async {
    final result = await makeCall(() => _debugRepository.saveServerUrl(url));

    if (result is ResultOk) _serverUrlState.value = url;
  }

  /// Change proxyUrl value.
  Future<void> setProxy(String url) async {
    await makeCall(() => _debugRepository.saveProxyUrl(url));
  }

  @override
  void dispose() {
    _serverUrlState.dispose();
    super.dispose();
  }
}
