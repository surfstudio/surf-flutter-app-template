// ignore_for_file: no-equal-arguments
import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_message_type.dart';
import 'package:flutter_template/uikit/app_sizes.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';
import 'package:flutter_template/uikit/text/app_text_scheme.dart';

/// Default controller for displaying messages.
class DefaultSnackController {
  /// Create an instance [DefaultSnackController].
  const DefaultSnackController();

  /// Show the message.
  Future<void> showSnack({
    required SnackMessageType messageType,
    required String message,
    required BuildContext context,
    required EasyDialogDecoration dialogDecoration,
    required EasyDialogAnimationConfiguration animationConfiguration,
    Duration? autoHideDuration,
  }) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);
    final topPadding = MediaQuery.of(context).viewPadding.top;
    return FlutterEasyDialogs.show(
      EasyDialog.positioned(
        decoration: dialogDecoration,
        content: SizedBox(
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: switch (messageType) {
                // TODO(anyone): Set up colors according to your theme.
                SnackMessageType.error => colorScheme.danger,
                SnackMessageType.success => colorScheme.positive,
                SnackMessageType.warning => colorScheme.dangerSecondary,
              },
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSizes.double16,
                topPadding + AppSizes.double8,
                AppSizes.double16,
                AppSizes.double16,
              ),
              child: Text(
                message,
                style: textScheme.label.copyWith(
                  color: switch (messageType) {
                    // TODO(anyone): Set up colors according to your theme.
                    SnackMessageType.error => colorScheme.onDanger,
                    SnackMessageType.success => colorScheme.onPositive,
                    SnackMessageType.warning => colorScheme.onDanger,
                  },
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        autoHideDuration: autoHideDuration,
        animationConfiguration: animationConfiguration,
      ).swipe(
        direction: DismissDirection.up,
        willDismiss: () => true,
      ),
    );
  }

  /// Hide Snack.
  Future<void> hideSnack() {
    return FlutterEasyDialogs.hide(
      PositionedDialog.identifier(
        position: EasyDialogPosition.top,
      ),
      instantly: true,
    );
  }
}
