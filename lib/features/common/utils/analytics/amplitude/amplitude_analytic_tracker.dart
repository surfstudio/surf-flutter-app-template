import 'package:analytics/core/analytic_action.dart';
import 'package:analytics/core/analytic_action_performer.dart';
import 'package:flutter_template/features/common/utils/analytics/base/analytic_event.dart';
import 'package:flutter_template/features/common/utils/analytics/mock/mock_amplitude_analytics.dart';

/// A class for sending analytics data to Amplitude.
class AmplitudeAnalyticTracker implements AnalyticActionPerformer<AnalyticEvent> {
  /// The instance of MockAmplitudeAnalytics used for sending analytics data.
  final MockAmplitudeAnalytics _analytics;

  /// Constructs an instance of [AmplitudeAnalyticTracker].
  ///
  /// The [_analytics] parameter is required to initialize the tracker.
  AmplitudeAnalyticTracker(this._analytics);

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
