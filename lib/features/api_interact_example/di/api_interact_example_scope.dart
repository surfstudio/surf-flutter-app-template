import 'package:flutter_template/features/api_interact_example/data/repositories/api_interact_example_repository.dart';
import 'package:flutter_template/features/api_interact_example/domain/repositories/i_api_interact_example_repository.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';

/// Scope dependencies of the ApiInteractExample feature
abstract interface class IApiInteractExampleScope implements IDisposableObject {
  /// ApiInteractExampleRepository
  IApiInteractExampleRepository get repository;
}

/// {@template api_interact_example_scope.class}
/// Implementation of [IApiInteractExampleScope]
/// {@endtemplate}
final class ApiInteractExampleScope extends DisposableObject implements IApiInteractExampleScope {
  @override
  late final IApiInteractExampleRepository repository;

  /// Factory constructor for [IApiInteractExampleScope]
  factory ApiInteractExampleScope.create() {
    return ApiInteractExampleScope(const ApiInteractExampleRepository());
  }

  /// {@macro api_interact_example_scope.class}
  ApiInteractExampleScope(this.repository);
}
