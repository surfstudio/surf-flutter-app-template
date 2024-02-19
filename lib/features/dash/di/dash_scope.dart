import 'package:flutter_template/features/dash/data/repositories/dash_repository.dart';
import 'package:flutter_template/features/dash/domain/repositories/i_dash_repository.dart';
import 'package:flutter_template/util/disposable_object/disposable_object.dart';
import 'package:flutter_template/util/disposable_object/i_disposable_object.dart';

/// Interface for Dash DI Scope.
abstract interface class IDashScope implements IDisposableObject {
  /// Dash repository
  abstract final IDashRepository dashRepository;
}

/// {@template dash_scope.class}
/// Dependencies scope of Dash module.
/// {@endtemplate}
final class DashScope extends DisposableObject implements IDashScope {
  @override
  final IDashRepository dashRepository;

  /// Factory constructor for [DashScope]
  factory DashScope.create() {
    return DashScope(const DashRepository());
  }

  /// {@macro dash_scope.class}
  DashScope(this.dashRepository);
}
