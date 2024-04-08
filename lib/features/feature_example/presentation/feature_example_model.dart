import 'package:elementary/elementary.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/core/architecture/presentation/base_model.dart';
import 'package:flutter_template/features/feature_example/domain/entities/ip_entity.dart';
import 'package:flutter_template/features/feature_example/domain/repositories/i_feature_example_repository.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_screen.dart';
import 'package:union_state/union_state.dart';

/// {@template feature_example_model.class}
/// [ElementaryModel] for [FeatureExampleScreen].
/// {@endtemplate}
final class FeatureExampleModel extends BaseModel {
  final IFeatureExampleRepository _repository;
  final _state = UnionStateNotifier<IpEntity>.loading();

  /// State of screen.
  UnionStateNotifier<IpEntity> get state => _state;

  /// {@macro feature_example_model.class}
  FeatureExampleModel({
    required IFeatureExampleRepository repository,
    required super.logWriter,
  }) : _repository = repository;

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  /// Load IP address.
  Future<void> loadIp() async {
    _state.loading();

    final result = await makeCall(_repository.getIp);

    switch (result) {
      case ResultOk(:final data):
        _state.content(data);
      case ResultFailed(:final failure):
        _state.failure(failure);
    }
  }
}
