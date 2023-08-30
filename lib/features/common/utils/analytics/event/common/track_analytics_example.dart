import 'package:flutter_template/features/common/utils/analytics/base/analytic_event.dart';
import 'package:flutter_template/features/common/utils/analytics/ids_analytics_events.dart';

/// An example event for demonstrating the functionality of the analytics tracking service.
class TrackAnalyticsExampleEvent implements AnalyticEvent {
  /// Returns the analytics key associated with the event for tracking.
  @override
  String get id => IdsAnalyticsEvents.trackAnalyticsExample.id;

  /// Returns a map of additional parameters associated with the event.
  @override
  Map<String, int> get params => {};

  /// Constructs a new instance of [TrackAnalyticsExampleEvent].
  const TrackAnalyticsExampleEvent();

  /// Returns a string representation of the event.
  @override
  String toString() => 'TrackAnalyticsExampleEvent';
}
