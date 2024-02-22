import 'package:analytics/core/analytic_action.dart';

/// An abstract class representing an analytics service.
///
/// ignore: one_member_abstracts
abstract class IAnalyticsService {
  /// Tracks the provided [action] within the current analytics service.
  ///
  /// The [action] parameter represents the analytic action to be tracked, such as an event.
  void trackEvent(AnalyticAction action);
}
