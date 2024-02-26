import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/feature_example/domain/repositories/feature_example_repository.dart';
import 'package:flutter_template/features/feature_example/presentation/screens/api_interact_example/api_interact_example_screen.dart';
import 'package:flutter_template/features/feature_example/presentation/screens/api_interact_example/api_interact_example_state.dart';

/// {@template feature_example_model.class}
/// [ElementaryModel] for [ApiInteractExampleScreen]
/// {@endtemplate}
final class ApiInteractExampleModel extends ElementaryModel {
  final IFeatureExampleRepository _repository;

  /// {@macro feature_example_model.class}
  ApiInteractExampleModel({
    required IFeatureExampleRepository repository,
    super.errorHandler,
  }) : _repository = repository;

  final _ipState = ValueNotifier<ApiInteractExampleState>(ApiInteractExampleStateInitial());

  /// State of screen.
  ValueListenable<ApiInteractExampleState> get screenState => _ipState;

  /// Load IP address.
  Future<void> loadIp() async {
    _emit(ApiInteractExampleStateLoading());

    final result = await _repository.getIp();

    switch (result) {
      case ResultOk(:final data):
        _emit(ApiInteractExampleStateLoaded(data.ip));
      case ResultFailed():
        _emit(ApiInteractExampleStateError());
    }
  }

  // ignore: use_setters_to_change_properties
  void _emit(ApiInteractExampleState state) {
    _ipState.value = state;
  }
}
