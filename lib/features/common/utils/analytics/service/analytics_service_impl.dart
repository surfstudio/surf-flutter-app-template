import 'package:analytics/core/analytic_action.dart';
import 'package:analytics/core/analytic_action_performer.dart';
import 'package:analytics/core/analytic_service.dart';
import 'package:analytics/impl/default_analytic_service.dart';
import 'package:flutter_template/features/common/utils/analytics/base/analytic_event.dart';
import 'package:flutter_template/features/common/utils/analytics/service/analytics_service.dart';

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
