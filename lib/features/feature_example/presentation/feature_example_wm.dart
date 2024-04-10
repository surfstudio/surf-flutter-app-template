import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/common/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/feature_example/di/feature_example_scope.dart';
import 'package:flutter_template/features/feature_example/domain/entities/ip_entity.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_model.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_screen.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

/// DI factory for [FeatureExampleWM].
FeatureExampleWM defaultFeatureExampleWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final scope = context.read<IFeatureExampleScope>();

  return FeatureExampleWM(
    FeatureExampleModel(
      repository: scope.repository,
      logWriter: appScope.logger,
    ),
  );
}

/// Interface for [FeatureExampleWM].
abstract interface class IFeatureExampleWM with ThemeIModelMixin, ILocalizationMixin implements IWidgetModel {
  /// State of screen.
  UnionStateNotifier<IpEntity> get state;
}

/// {@template feature_example_wm.class}
/// [WidgetModel] for [FeatureExampleScreen].
/// {@endtemplate}
final class FeatureExampleWM extends WidgetModel<FeatureExampleScreen, FeatureExampleModel>
    with ThemeWMMixin, LocalizationMixin
    implements IFeatureExampleWM {
  @override
  UnionStateNotifier<IpEntity> get state => model.state;

  /// {@macro feature_example_wm.class}
  FeatureExampleWM(super._model);

  @override
  void initWidgetModel() {
    unawaited(model.loadIp());
    super.initWidgetModel();
  }
}
