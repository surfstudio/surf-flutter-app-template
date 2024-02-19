import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/mixin/localization_mixin.dart';
import 'package:flutter_template/features/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/common/utils/analytics/event/common/track_analytics_example.dart';
import 'package:flutter_template/features/common/utils/analytics/service/analytics_service.dart';
import 'package:flutter_template/features/dash/screen/dash_screen.dart';
import 'package:flutter_template/features/dash/screen/dash_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [DashScreenWidgetModel].
DashScreenWidgetModel dashScreenWmFactory(
  BuildContext context,
) {
  final scope = context.read<IAppScope>();
  final model = DashScreenModel();

  return DashScreenWidgetModel(
    model: model,
    analyticsService: scope.analyticsService,
  );
}

/// Widget model for [DashScreen].
class DashScreenWidgetModel extends WidgetModel<DashScreen, DashScreenModel>
    with LocalizationMixin, ThemeWMMixin
    implements IDashScreenWidgetModel {
  final IAnalyticsService _analyticsService;

  /// Create an instance [DashScreenWidgetModel].
  DashScreenWidgetModel({
    required DashScreenModel model,
    required IAnalyticsService analyticsService,
  })  : _analyticsService = analyticsService,
        super(model);

  @override
  void trackAnalyticsExample() {
    _analyticsService.trackEvent(const TrackAnalyticsExampleEvent());
  }
}

/// Interface of [IDashScreenWidgetModel].
abstract class IDashScreenWidgetModel
    with ILocalizationMixin, ThemeIModelMixin
    implements IWidgetModel {
  /// Sending an analytics event
  void trackAnalyticsExample();
}
