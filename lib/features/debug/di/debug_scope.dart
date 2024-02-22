import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/debug/data/repositories/debug_repository.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';

/// {@template debug_scope.class}
/// Dependencies scope of Debug module.
/// {@endtemplate}
final class DebugScope extends DisposableObject implements IDebugScope {
  @override
  final IDebugRepository debugRepository;

  /// Factory constructor for [DebugScope].
  factory DebugScope.create() {
    return DebugScope(const DebugRepository());
  }

  /// {@macro debug_scope.class}
  DebugScope(this.debugRepository);
}

/// Interface for Debug DI Scope.
abstract interface class IDebugScope implements IDisposableObject {
  /// Debug repository.
  abstract final IDebugRepository debugRepository;
}
