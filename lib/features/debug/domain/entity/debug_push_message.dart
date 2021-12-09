import 'package:push_notification/push_notification.dart';

/// Payload data for debug push notification.
class DebugPushMessage extends NotificationPayload {
  /// Create an instance [DebugPushMessage].
  DebugPushMessage(
    Map<String, dynamic> messageData,
    String title,
    String body,
  ) : super(messageData, title, body);

  /// Method returns a new [DebugPushMessage] based on the passed map.
  factory DebugPushMessage.fromMap(Map<String, dynamic> map) {
    final notificationJson = map.get<Map<String, dynamic>>('notification');
    return DebugPushMessage(
      map,
      notificationJson.get<String>('title'),
      notificationJson.get<String>('body'),
    );
  }
}

/// Error handler when trying to get data from the map.
extension JsonExceptions on Map<String, dynamic> {
  /// Returns either valid data or throws an Exception.
  T get<T>(String key, {T? defaultValue}) {
    final dynamic value = this[key];

    if (value == null && defaultValue != null) return defaultValue;
    if (value is T) {
      return value;
    } else {
      throw Exception(
        'JsonExtension.get() Exception. ${value.runtimeType} is not $T',
      );
    }
  }
}
