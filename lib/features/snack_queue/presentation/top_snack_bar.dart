import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:flutter_template/features/snack_queue/presentation/snack_message_type.dart';

/// Display information for the snack.
@immutable
class TopSnackBar {
  /// Message in the snack.
  final String message;

  /// Type of message.
  final SnackMessageType messageType;

  /// Snack display time.
  final DateTime showTime;

  /// Decoration for animation.
  final EasyDialogDecoration dialogDecoration;

  /// Create an instance [TopSnackBar].
  TopSnackBar({
    required this.message,
    required this.messageType,
    EasyDialogDecoration? dialogDecoration,
  })  : showTime = DateTime.now(),
        dialogDecoration = dialogDecoration ?? const EasyDialogDecoration.none();

  @override
  String toString() {
    return 'TopSnackBar{messageType: $messageType, message: $message';
  }
}
