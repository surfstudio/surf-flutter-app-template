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
    required super.logWriter,
  }) : _debugRepository = debugRepository;

  /// Save server Url to local storage.
  Future<void> saveServerUrl(Url url) async {
    await makeCall(() => _debugRepository.saveServerUrl(url));
  }

  /// Save proxy Url to local storage.
  Future<void> saveProxyUrl(String url) async {
    final newProxyUrl = url.isEmpty ? null : url;
    await makeCall(() => _debugRepository.saveProxyUrl(newProxyUrl));
  }
}
