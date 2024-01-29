import 'package:flutter/foundation.dart';

// TODO(init): can be removed, added for demo analytics track
/// A temporary mock class for demonstrating the setup of analytics.
class MockAmplitudeAnalytics {
  /// Sends analytics data.
  ///
  /// The [name] parameter is the event name, and the [parameters] parameter is an optional map of
  /// additional parameters associated with the event.
  void logEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) {
    debugPrint('logEvent MockAmplitudeAnalytics: name: $name, parameters: $parameters');
  }
}
