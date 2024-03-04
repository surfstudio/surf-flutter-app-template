import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/feature_example/di/feature_example_scope.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_model.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_screen.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_state.dart';
import 'package:provider/provider.dart';

/// DI factory for [FeatureExampleWM]
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

/// Interface for [FeatureExampleWM]
abstract interface class IFeatureExampleWM
    with ThemeIModelMixin, ILocalizationMixin
    implements IWidgetModel {
  /// State of screen.
  ValueListenable<FeatureExampleState> get state;
}

/// {@template feature_example_wm.class}
/// [WidgetModel] for [FeatureExampleScreen]
/// {@endtemplate}
final class FeatureExampleWM extends WidgetModel<FeatureExampleScreen, FeatureExampleModel>
    with ThemeWMMixin, LocalizationMixin
    implements IFeatureExampleWM {
  /// {@macro feature_example_wm.class}
  FeatureExampleWM(super._model);

  @override
  void initWidgetModel() {
    model.loadIp();
    super.initWidgetModel();
  }

  @override
  ValueListenable<FeatureExampleState> get state => model.state;
}
