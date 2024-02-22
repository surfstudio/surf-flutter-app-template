import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/api_interact_example/domain/repositories/i_api_interact_example_repository.dart';
import 'package:flutter_template/features/api_interact_example/presentation/screens/api_interact_example/api_interact_example_screen.dart';
import 'package:union_state/union_state.dart';

/// Typedef for [UnionState] IP address.
typedef IpUnionState = UnionState<String?>;

/// {@template api_interact_example_model.class}
/// [ElementaryModel] for [ApiInteractExampleScreen]
/// {@endtemplate}
final class ApiInteractExampleModel extends ElementaryModel {
  final IApiInteractExampleRepository _repository;

  /// {@macro api_interact_example_model.class}
  ApiInteractExampleModel({
    required IApiInteractExampleRepository repository,
    super.errorHandler,
  }) : _repository = repository;

  /// IP address state.
  final _ipState = UnionStateNotifier<String?>(null);

  /// State Notifier for IP address.
  ValueListenable<IpUnionState> get ipState => _ipState;

  /// Load IP address.
  Future<void> loadIp() async {
    _ipState.loading();

    final result = await _repository.getIp();

    switch (result) {
      case ResultOk(:final data):
        _ipState.content(data.ip);

      case ResultFailed(:final failure):
        _ipState.failure(failure);
    }
  }
}
