import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/api_interact_example/di/api_interact_example_scope.dart';
import 'package:flutter_template/features/api_interact_example/presentation/screens/api_interact_example/api_interact_example_model.dart';
import 'package:flutter_template/features/api_interact_example/presentation/screens/api_interact_example/api_interact_example_screen.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:provider/provider.dart';

/// DI factory for [ApiInteractExampleWM]
ApiInteractExampleWM defaultApiInteractExampleWMFactory(BuildContext context) {
  final scope = context.read<IApiInteractExampleScope>();

  return ApiInteractExampleWM(ApiInteractExampleModel(repository: scope.repository));
}

/// Interface for [ApiInteractExampleWM]
abstract interface class IApiInteractExampleWM with ThemeIModelMixin implements IWidgetModel {
  /// State notifier with IP address.
  ValueListenable<IpUnionState> get ipState;

  /// Localization strings.
  AppLocalizations get l10n;
}

/// {@template api_interact_example_wm.class}
/// [WidgetModel] for [ApiInteractExampleScreen]
/// {@endtemplate}
final class ApiInteractExampleWM
    extends WidgetModel<ApiInteractExampleScreen, ApiInteractExampleModel>
    with ThemeWMMixin
    implements IApiInteractExampleWM {
  /// {@macro api_interact_example_wm.class}
  ApiInteractExampleWM(super._model);

  @override
  void initWidgetModel() {
    model.loadIp();
    super.initWidgetModel();
  }

  @override
  ValueListenable<IpUnionState> get ipState => model.ipState;

  @override
  AppLocalizations get l10n => context.l10n;
}