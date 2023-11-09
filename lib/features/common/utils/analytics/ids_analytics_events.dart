/// Identifiers for analytics events.
enum IdsAnalyticsEvents {
  /// Event to demonstrate the functionality of the analytics tracking service.
  trackAnalyticsExample(id: 'track_analytics_example'),

  /// First app launch event.
  firstRun(id: 'first_run');

  /// The name of the key.
  final String id;

  /// Constructs an instance of [IdsAnalyticsEvents].
  const IdsAnalyticsEvents({
    required this.id,
  });
}
