import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_message_type.dart';

/// Display information for the snack.
@immutable
class TopSnackBar {
  static const _defaultDialogDecoration = EasyDialogDecoration.combine(
    [
      EasyDialogAnimation.fade(),
      EasyDialogAnimation.expansion(),
    ],
  );
  static const _defaultAnimationConfiguration = EasyDialogAnimationConfiguration.bounded();

  /// Message in the snack.
  final String message;

  /// Type of message.
  final SnackMessageType messageType;

  /// Snack display time.
  final DateTime showTime;

  /// Decoration for animation.
  ///
  /// Sets the type of the SnackBar animation. Default is [EasyDialogDecoration.none].
  final EasyDialogDecoration dialogDecoration;

  /// Animation configuration.
  ///
  /// Sets the animation configuration for the SnackBar (durattion, startValue, etc.).
  /// Default is [EasyDialogAnimationConfiguration.bounded].
  final EasyDialogAnimationConfiguration animationConfiguration;

  /// Create an instance [TopSnackBar].
  TopSnackBar({
    required this.message,
    required this.messageType,
    EasyDialogDecoration? dialogDecoration,
    EasyDialogAnimationConfiguration? animationConfiguration,
  })  : showTime = DateTime.now(),
        dialogDecoration = dialogDecoration ?? _defaultDialogDecoration,
        animationConfiguration = animationConfiguration ?? _defaultAnimationConfiguration;

  @override
  String toString() {
    return 'TopSnackBar{messageType: $messageType, message: $message';
  }
}
