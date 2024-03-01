import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/presentation/screens/ui_kit/ui_kit_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/ui_kit/ui_kit_screen.dart';
import 'package:provider/provider.dart';

/// Factory for [UiKitWM].
UiKitWM uiKitScreenWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();

  final model = UiKitModel(logWriter: appScope.logger);

  return UiKitWM(model);
}

/// Interface for [UiKitWM].
abstract class IUiKitWM with ILocalizationMixin, ThemeIModelMixin implements IWidgetModel {
  /// Theme switching callback.
  void switchTheme();

  /// Callback of pressing the primary button.
  void onPrimaryButtonPressed();

  /// Callback of pressing the secondary button.
  void onSecondaryButtonPressed();

  /// Callback of pressing the tertiary button.
  void onTertiaryButtonPressed();

  /// Callback of pressing the tetradic button.
  void onTetradicButtonPressed();

  /// Callback of pressing the danger snack button.
  void onDangerSnackButtonPressed();

  /// Callback of pressing the positive snack button.
  void onPositiveSnackButtonPressed();
}

/// {@template ui_kit_widget_model.class}
/// [WidgetModel] for [UiKitScreen].
/// {@endtemplate}
class UiKitWM extends WidgetModel<UiKitScreen, UiKitModel> with LocalizationMixin, ThemeWMMixin implements IUiKitWM {
  late final ScaffoldMessengerState _scaffoldMessenger;

  /// {@macro ui_kit_widget_model.class}
  UiKitWM(super._model);

  @override
  void initWidgetModel() {
    _scaffoldMessenger = ScaffoldMessenger.of(context);
    super.initWidgetModel();
  }

  @override
  void switchTheme() => context.read<IAppScope>().themeService.switchTheme();

  @override
  void onPrimaryButtonPressed() {
    _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenPrimaryButtonSnackText)));
  }

  @override
  void onSecondaryButtonPressed() {
    _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenSecondaryButtonSnackText)));
  }

  @override
  void onTetradicButtonPressed() {
    _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenTetradicButtonSnackText)));
  }

  @override
  void onTertiaryButtonPressed() {
    _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenTertiaryButtonSnackText)));
  }

  @override
  void onDangerSnackButtonPressed() {
    _scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.danger,
        content: Text(
          l10n.uiKitScreenDangerSnackText,
          style: TextStyle(color: colorScheme.onDanger),
        ),
      ),
    );
  }

  @override
  void onPositiveSnackButtonPressed() {
    _scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.positive,
        content: Text(
          l10n.uiKitScreenPositiveSnackText,
          style: TextStyle(color: colorScheme.onPositive),
        ),
      ),
    );
  }
}
