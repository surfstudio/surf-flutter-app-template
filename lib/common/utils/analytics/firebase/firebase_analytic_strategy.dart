import 'package:analytics/core/analytic_strategy.dart';
import 'package:flutter_template/common/utils/analytics/base/analytic_event.dart';
import 'package:flutter_template/common/utils/analytics/mock/mock_firebase_analytics.dart';

/// {@template firebase_analytic_strategy.class}
/// A class for sending analytics data to Firebase.
/// {@endtemplate}
class FirebaseAnalyticStrategy extends AnalyticStrategy<AnalyticEvent> {
  /// The instance of MockFirebaseAnalytics used for sending analytics data.
  final MockFirebaseAnalytics _analytics;

  /// {@macro firebase_analytic_strategy.class}
  FirebaseAnalyticStrategy(this._analytics);

  @override
  void performAction(AnalyticEvent action) {
    _analytics.logEvent(
      name: action.id,
      parameters: action.params,
    );
  }
}
