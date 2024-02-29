import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/common/utils/extentions/value_notifier_x.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/feature_example/domain/repositories/i_feature_example_repository.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_screen.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_state.dart';

/// {@template feature_example_model.class}
/// [ElementaryModel] for [FeatureExampleScreen]
/// {@endtemplate}
final class FeatureExampleModel extends BaseModel {
  final IFeatureExampleRepository _repository;

  /// {@macro feature_example_model.class}
  FeatureExampleModel({
    required IFeatureExampleRepository repository,
    required super.logWriter,
  }) : _repository = repository;

  final _state = ValueNotifier<FeatureExampleState>(const FeatureExampleStateInitial());

  /// State of screen.
  ValueListenable<FeatureExampleState> get state => _state;

  /// Load IP address.
  Future<void> loadIp() async {
    _state.emit(const FeatureExampleStateLoading());

    final result = await _repository.getIp();

    switch (result) {
      case ResultOk(:final data):
        _state.emit(FeatureExampleStateLoaded(data.ip));
      case ResultFailed():
        _state.emit(const FeatureExampleStateError());
    }
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }
}
