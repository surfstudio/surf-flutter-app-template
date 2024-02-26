import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/feature_example/di/feature_example_scope.dart';
import 'package:flutter_template/features/feature_example/presentation/screens/api_interact_example/api_interact_example_model.dart';
import 'package:flutter_template/features/feature_example/presentation/screens/api_interact_example/api_interact_example_screen.dart';
import 'package:flutter_template/features/feature_example/presentation/screens/api_interact_example/api_interact_example_state.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:provider/provider.dart';

/// DI factory for [ApiInteractExampleWM]
ApiInteractExampleWM defaultApiInteractExampleWMFactory(BuildContext context) {
  final scope = context.read<IFeatureExampleScope>();

  return ApiInteractExampleWM(ApiInteractExampleModel(repository: scope.repository));
}

/// Interface for [ApiInteractExampleWM]
abstract interface class IApiInteractExampleWM with ThemeIModelMixin implements IWidgetModel {
  /// State of screen.
  ValueListenable<ApiInteractExampleState> get screenState;

  /// Localization strings.
  AppLocalizations get l10n;
}

/// {@template feature_example_wm.class}
/// [WidgetModel] for [ApiInteractExampleScreen]
/// {@endtemplate}
final class ApiInteractExampleWM extends WidgetModel<ApiInteractExampleScreen, ApiInteractExampleModel>
    with ThemeWMMixin, LocalizationMixin
    implements IApiInteractExampleWM {
  /// {@macro feature_example_wm.class}
  ApiInteractExampleWM(super._model);

  @override
  void initWidgetModel() {
    model.loadIp();
    super.initWidgetModel();
  }

  @override
  ValueListenable<ApiInteractExampleState> get screenState => model.screenState;
}
