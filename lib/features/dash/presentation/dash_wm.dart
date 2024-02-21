import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/common/utils/analytics/event/common/track_analytics_example.dart';
import 'package:flutter_template/common/utils/analytics/service/analytics_service.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_mixin.dart';
import 'package:flutter_template/features/dash/presentation/dash_model.dart';
import 'package:flutter_template/features/dash/presentation/dash_screen.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
import 'package:flutter_template/features/common/mixin/localization_mixin.dart';
import 'package:flutter_template/features/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/common/utils/analytics/event/common/track_analytics_example.dart';
import 'package:flutter_template/features/common/utils/analytics/service/analytics_service.dart';
import 'package:flutter_template/features/dash/screen/dash_screen.dart';
import 'package:flutter_template/features/dash/screen/dash_screen_model.dart';
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
class DashWidgetModel extends WidgetModel<DashScreen, DashScreenModel>
    with ThemeWMMixin
    implements IDashWidgetModel {
  final IAnalyticsService _analyticsService;

  /// Create an instance [DashWidgetModel].
  DashScreenWidgetModel({
    required DashModel model,
    required IAnalyticsService analyticsService,
  })  : _analyticsService = analyticsService,
        super(model);

  @override
  void trackAnalyticsExample() {
    _analyticsService.trackEvent(const TrackAnalyticsExampleEvent());
  }
}

/// Interface for [DashWidgetModel].
abstract class IDashWidgetModel
    with ILocalizationMixin, ThemeIModelMixin
    implements IWidgetModel {
  /// Sending an analytics event
  void trackAnalyticsExample();
}
