import 'package:analytics/analytics.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/common/utils/analytics/event/common/track_analytics_example.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/dash/presentation/dash_model.dart';
import 'package:flutter_template/features/dash/presentation/dash_screen.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:provider/provider.dart';

/// Factory for [DashWidgetModel].
DashWidgetModel dashScreenWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = DashModel(logWriter: appScope.logger);
  final appRouter = context.read<AppRouter>();

  return DashWidgetModel(
    model: model,
    analyticsService: appScope.analyticsService,
    router: appRouter,
  );
}

/// Widget model for [DashScreen].
class DashWidgetModel extends WidgetModel<DashScreen, DashModel>
    with ThemeWMMixin, LocalizationMixin
    implements IDashWidgetModel {
  final AnalyticService _analyticsService;
  final AppRouter _router;

  /// Create an instance [DashWidgetModel].
  DashWidgetModel({
    required DashModel model,
    required AnalyticService analyticsService,
    required AppRouter router,
  })  : _analyticsService = analyticsService,
        _router = router,
        super(model);

  @override
  void trackAnalyticsExample() {
    _analyticsService.performAction(const TrackAnalyticsExampleEvent());
  }

  @override
  void goToFeatureExampleScreen() {
    _router.navigate(const FeatureExampleRoute());
  }
}

/// Interface for [DashWidgetModel].
abstract class IDashWidgetModel with ThemeIModelMixin, ILocalizationMixin implements IWidgetModel {
  /// Sending an analytics event
  void trackAnalyticsExample();

  /// Сallback of the transition to feature example screen
  void goToFeatureExampleScreen();
}
