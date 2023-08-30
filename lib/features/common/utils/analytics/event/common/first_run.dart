import 'package:flutter_template/features/common/utils/analytics/base/analytic_event.dart';
import 'package:flutter_template/features/common/utils/analytics/ids_analytics_events.dart';

/// Represents an event that occurs during the first launch of the app.
class FirstRunEvent implements AnalyticEvent {
  /// Returns the key associated with the event for analytics tracking.
  @override
  String get id => IdsAnalyticsEvents.firstRun.id;

  /// Returns a map of additional parameters associated with the event.
  @override
  Map<String, int> get params => {};

  /// Constructs a new instance of [FirstRunEvent].
  const FirstRunEvent();

  /// Returns a string representation of the event.
  @override
  String toString() => 'FirstRunEvent';
}
