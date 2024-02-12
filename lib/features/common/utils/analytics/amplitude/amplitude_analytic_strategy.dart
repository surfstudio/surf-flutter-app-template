import 'package:analytics/core/analytic_strategy.dart';
import 'package:flutter_template/features/common/utils/analytics/base/analytic_event.dart';
import 'package:flutter_template/features/common/utils/analytics/mock/mock_amplitude_analytics.dart';

/// {@template amplitude_analytic_strategy.class}
/// A class for sending analytics data to Amplitude.
/// {@endtemplate}
class AmplitudeAnalyticStrategy extends AnalyticStrategy<AnalyticEvent> {
  /// The instance of MockAmplitudeAnalytics used for sending analytics data.
  final MockAmplitudeAnalytics _analyticsApi;

  /// {@macro amplitude_analytic_strategy.class}
  AmplitudeAnalyticStrategy(this._analyticsApi);

  @override
  void performAction(AnalyticEvent action) {
    return _analyticsApi.logEvent(
      name: action.id,
      parameters: action.params,
    );
  }
}
