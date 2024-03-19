import 'package:flutter/material.dart';
import 'package:flutter_template/api/service/ip/ip_api.dart';
import 'package:flutter_template/common/utils/disposable_object/disposable_object.dart';
import 'package:flutter_template/common/utils/disposable_object/i_disposable_object.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/feature_example/data/converters/ip_converter.dart';
import 'package:flutter_template/features/feature_example/data/repositories/feature_example_repository.dart';
import 'package:flutter_template/features/feature_example/domain/repositories/i_feature_example_repository.dart';
import 'package:provider/provider.dart';

/// {@template feature_example_scope.class}
/// Implementation of [IFeatureExampleScope].
/// {@endtemplate}
final class FeatureExampleScope extends DisposableObject implements IFeatureExampleScope {
  @override
  final IFeatureExampleRepository repository;

  /// Factory constructor for [IFeatureExampleScope].
  factory FeatureExampleScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    const ipUrl = 'https://api.ipify.org/';

    return FeatureExampleScope(
      FeatureExampleRepository(
        ipApi: IpApi(appScope.dio, baseUrl: ipUrl),
        ipConverter: const IpConverter(),
      ),
    );
  }

  /// {@macro feature_example_scope.class}
  FeatureExampleScope(this.repository);
}

/// Scope dependencies of the FeatureExample feature.
abstract interface class IFeatureExampleScope implements IDisposableObject {
  /// FeatureExampleRepository.
  IFeatureExampleRepository get repository;
}
