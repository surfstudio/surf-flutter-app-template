# Analytics 

Analytics sending is built upon the `SurfGear` `analytics` package.

### Step-by-Step Instructions

1. The package provides an abstract class `AnalyticAction` - an analytics event.

   For our specific events, it's necessary to create an implementation of this class - `AnalyticEvent`.

```dart
    abstract class AnalyticEvent implements AnalyticAction, HasId, HasMapParams {}
```

2. Add an event identifier to the special class - `enum IdsAnalyticsEvents`.

```dart
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
```
3. Next, create the event.

```dart
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
```
4. Create a statistics tracker.

The tracker should implement the `AnalyticActionPerformer<AnalyticEvent>` class from the analytics package.
`AnalyticActionPerformer` encapsulates the work with a specific analytics service within itself.

```dart
/// A class for sending analytics data to Firebase
class FirebaseAnalyticTracker implements AnalyticActionPerformer<AnalyticEvent> {
  /// The instance of MockFirebaseAnalytics used for sending analytics data.
  final FirebaseAnalytics _analytics;

  /// Constructs an instance of [FirebaseAnalyticTracker].
  ///
  /// The [_analytics] parameter is required to initialize the tracker.
  const FirebaseAnalyticTracker(
    this._analytics,
  );

  /// Checks if the provided [action] can be handled by this tracker.
  ///
  /// Returns true if the [action] is an instance of AnalyticEvent, indicating that
  /// it can be processed by this tracker.
  @override
  bool canHandle(AnalyticAction action) => action is AnalyticEvent;

  /// Performs the analytics tracking for the provided [action].
  ///
  /// Uses the [_analytics] instance to log the event with the event name
  /// and additional parameters from the [action].
  @override
  void perform(AnalyticEvent action) {
    _analytics.logEvent(
      name: action.id,
      parameters: action.params,
    );
  }
}
```
5. Create a service for working with analytics:
- Pass a list of analytics trackers.
- Inside the service, create an `AnalyticService` from the analytics package.
- Add the trackers to it.
- To send events to all analytics systems, use the `trackEvent` method.

```dart
/// An analytics service implementation.
class AnalyticsServiceImpl implements IAnalyticsService {
  /// The collection of trackers responsible for performing analytics actions.
  final Iterable<AnalyticActionPerformer<AnalyticEvent>> _analyticsTrackers;

  /// The service responsible for triggering analytics actions.
  late final AnalyticService _analyticService;

  /// Constructs an instance of [AnalyticsServiceImpl].
  ///
  /// The [_analyticsTrackers] parameter is a collection of trackers responsible for
  /// performing analytics actions.
  AnalyticsServiceImpl(this._analyticsTrackers) {
    _init();
  }

  /// Sends an analytics event.
  @override
  void trackEvent(AnalyticAction action) {
    _analyticService.performAction(action);
  }

  /// Initializes the analytics service.
  void _init() {
    final analyticService = DefaultAnalyticService();
    _analyticsTrackers.forEach(analyticService.addActionPerformer);
    _analyticService = analyticService;
  }
}
```
6. Add the analytics service to the AppScope.

```dart
/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final IAnalyticsService _analyticsService;

  @override
  IAnalyticsService get analyticsService => _analyticsService;

  /// Create an instance [AppScope].
  AppScope() {
    _analyticsService = AnalyticsServiceImpl([
      FirebaseAnalyticTracker(FirebaseAnalytics.instance),
      AmplitudeAnalyticTracker(Amplitude.getInstance(instanceName: 'project')),
    ]);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Analytics sending service
  IAnalyticsService get analyticsService;
}
```

### Useful links

[How to work with the analytics package](https://pub.dev/packages/analytics).



