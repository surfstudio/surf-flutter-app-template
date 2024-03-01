import 'package:flutter/foundation.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';

/// {@template debug_model.class}
/// Model for [DebugScreen].
/// {@endtemplate}
final class DebugScreenModel extends BaseModel {
  final IDebugRepository _debugRepository;

  /// {@macro debug_model.class}
  DebugScreenModel({
    required IDebugRepository debugRepository,
    required Url serverUrl,
    required super.logWriter,
  }) : _debugRepository = debugRepository {
    _serverUrlState = ValueNotifier(serverUrl);
  }

  late final ValueNotifier<Url> _serverUrlState;

  /// Current server url state.
  ValueListenable<Url> get serverUrlState => _serverUrlState;

  /// Save server Url to local storage.
  Future<void> saveServerUrl(Url url) async {
    await makeCall(() => _debugRepository.saveServerUrl(url));
  }

  /// Save proxy Url to local storage.
  Future<void> saveProxyUrl(String url) async {
    final newProxyUrl = url.isEmpty ? null : url;
    await makeCall(() => _debugRepository.saveProxyUrl(newProxyUrl));
  }

  /// Set value for serverUrlState.
  // TODO(Evgenia-bit): убрать игнор после мержа ветки SNP-857-api в main
  // ignore: use_setters_to_change_properties
  void emitServerUrlState(Url url) {
    _serverUrlState.value = url;
  }

  @override
  void dispose() {
    _serverUrlState.dispose();
    super.dispose();
  }
}
