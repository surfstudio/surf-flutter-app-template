import 'package:analytics/core/analytyc_service.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/common/utils/analytics/event/common/track_analytics_example.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/dash/presentation/dash_model.dart';
import 'package:flutter_template/features/dash/presentation/dash_screen.dart';
import 'package:provider/provider.dart';

/// Factory for [DashWidgetModel].
DashWidgetModel dashScreenWmFactory(
  BuildContext context,
) {
  final scope = context.read<IAppScope>();
  final model = DashModel();

  return DashWidgetModel(
    model: model,
    analyticsService: scope.analyticsService,
  );
}

/// Widget model for [DashScreen].
class DashWidgetModel extends WidgetModel<DashScreen, DashModel>
    with LocalizationMixin, ThemeWMMixin
    implements IDashWidgetModel {
  final AnalyticService _analyticsService;

  /// Create an instance [DashWidgetModel].
  DashWidgetModel({
    required DashModel model,
    required AnalyticService analyticsService,
  })  : _analyticsService = analyticsService,
        super(model);

  @override
  void trackAnalyticsExample() {
    _analyticsService.performAction(const TrackAnalyticsExampleEvent());
  }
}

/// Interface for [DashWidgetModel].
abstract class IDashWidgetModel with ILocalizationMixin, ThemeIModelMixin implements IWidgetModel {
  /// Sending an analytics event
  void trackAnalyticsExample();
}
