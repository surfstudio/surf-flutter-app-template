import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/common/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/debug/presentation/ui_kit/ui_kit_model.dart';
import 'package:flutter_template/features/debug/presentation/ui_kit/ui_kit_screen.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_message_type.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_queue_controller.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_queue_provider.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_provider.dart';
import 'package:provider/provider.dart';

/// Factory for [UiKitWM].
UiKitWM uiKitScreenWMFactory(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  final snackQueueController = SnackQueueProvider.of(context);

  final model = UiKitModel(logWriter: appScope.logger);

  return UiKitWM(
    model,
    scaffoldMessenger: scaffoldMessenger,
    snackQueueController: snackQueueController,
  );
}

/// Interface for [UiKitWM].
abstract interface class IUiKitWM with ILocalizationMixin, ThemeIModelMixin implements IWidgetModel {
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

  /// Callback of pressing the danger snack button.
  void onDangerSnackQueueButtonPressed();

  /// Callback of pressing the positive snack button.
  void onPositiveSnackQueueButtonPressed();
}

/// {@template ui_kit_widget_model.class}
/// [WidgetModel] for [UiKitScreen].
/// {@endtemplate}
class UiKitWM extends WidgetModel<UiKitScreen, UiKitModel> with LocalizationMixin, ThemeWMMixin implements IUiKitWM {
  final ScaffoldMessengerState _scaffoldMessenger;
  final SnackQueueController _snackQueueController;

  /// {@macro ui_kit_widget_model.class}
  UiKitWM(
    super._model, {
    required ScaffoldMessengerState scaffoldMessenger,
    required SnackQueueController snackQueueController,
  })  : _scaffoldMessenger = scaffoldMessenger,
        _snackQueueController = snackQueueController;

  @override
  Future<void> switchTheme() => ThemeModeProvider.of(context).switchThemeMode();

  @override
  void onPrimaryButtonPressed() {
    final _ = _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenPrimaryButtonSnackText)));
  }

  @override
  void onSecondaryButtonPressed() {
    final _ = _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenSecondaryButtonSnackText)));
  }

  @override
  void onTetradicButtonPressed() {
    final _ = _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenTetradicButtonSnackText)));
  }

  @override
  void onTertiaryButtonPressed() {
    final _ = _scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.uiKitScreenTertiaryButtonSnackText)));
  }

  @override
  void onDangerSnackButtonPressed() {
    final _ = _scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          l10n.uiKitScreenDangerSnackText,
          style: TextStyle(color: colorScheme.onDanger),
        ),
        backgroundColor: colorScheme.danger,
      ),
    );
  }

  @override
  void onPositiveSnackButtonPressed() {
    final _ = _scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          l10n.uiKitScreenPositiveSnackText,
          style: TextStyle(color: colorScheme.onPositive),
        ),
        backgroundColor: colorScheme.positive,
      ),
    );
  }

  @override
  void onDangerSnackQueueButtonPressed() {
    _snackQueueController.addSnack(
      l10n.uiKitScreenDangerSnackText,
      messageType: SnackMessageType.error,
    );
  }

  @override
  void onPositiveSnackQueueButtonPressed() {
    _snackQueueController.addSnack(
      l10n.uiKitScreenPositiveSnackText,
      messageType: SnackMessageType.success,
    );
  }
}
