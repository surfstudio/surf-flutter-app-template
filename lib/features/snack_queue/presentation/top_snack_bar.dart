import 'package:flutter/material.dart';
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

  /// Create an instance [TopSnackBar].
  TopSnackBar({
    required this.message,
    required this.messageType,
  }) : showTime = DateTime.now();

  @override
  String toString() {
    return 'TopSnackBar{messageType: $messageType, message: $message';
  }
}
