import 'package:flutter_template/features/temp/data/repositories/temp_repository.dart';
import 'package:flutter_template/features/temp/domain/repositories/i_temp_repository.dart';
import 'package:flutter_template/util/disposable_object/disposable_object.dart';
import 'package:flutter_template/util/disposable_object/i_disposable_object.dart';

/// Interface for Temp DI Scope.
abstract interface class ITempScope implements IDisposableObject {
  /// Template repository
  abstract final ITempRepository templateRepository;
}

/// {@template temp_scope.class}
/// Dependencies scope of Template module.
/// {@endtemplate}
final class TempScope extends DisposableObject implements ITempScope {
  @override
  final ITempRepository templateRepository;

  /// Factory constructor for [TempScope]
  factory TempScope.create() {
    return TempScope(const TempRepository());
  }

  /// {@macro temp_scope.class}
  TempScope(this.templateRepository);
}
