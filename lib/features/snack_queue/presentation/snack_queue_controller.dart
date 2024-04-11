import 'package:flutter_template/features/snack_queue/domain/entities/snack_message_type.dart';

/// The controller for displaying snacks.
/// Will be available to descendants.
abstract interface class SnackQueueController {
  /// Add Snack to Queue.
  void addSnack(
    String message, {
    required SnackMessageType messageType,
  });

  /// Clears the snack queue from potential displays that were queued before [closeTime].
  void clearSnackQueue(DateTime closeTime);
}
