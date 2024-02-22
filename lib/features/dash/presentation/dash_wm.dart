import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/common/utils/analytics/event/common/track_analytics_example.dart';
import 'package:flutter_template/common/utils/analytics/service/analytics_service.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_mixin.dart';
import 'package:flutter_template/features/dash/presentation/dash_model.dart';
import 'package:flutter_template/features/dash/presentation/dash_screen.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
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
    router: scope.router,
  );
}

/// Widget model for [DashScreen].
class DashWidgetModel extends WidgetModel<DashScreen, DashModel> with ThemeWMMixin implements IDashWidgetModel {
  final IAnalyticsService _analyticsService;
  final AppRouter _router;

  @override
  AppLocalizations get l10n => context.l10n;

  /// Create an instance [DashWidgetModel].
  DashWidgetModel({
    required DashModel model,
    required IAnalyticsService analyticsService,
    required AppRouter router,
  })  : _analyticsService = analyticsService,
        _router = router,
        super(model);

  @override
  void trackAnalyticsExample() {
    _analyticsService.trackEvent(const TrackAnalyticsExampleEvent());
  }

  @override
  void goToIpScreen() {
    _router.navigate(const ApiInteractExampleRoute());
  }
}

/// Interface for [DashWidgetModel].
abstract class IDashWidgetModel with ThemeIModelMixin implements IWidgetModel {
  /// Localization strings.
  AppLocalizations get l10n;

  /// Sending an analytics event
  void trackAnalyticsExample();

  /// Сallback of the transition to the IP address screen
  void goToIpScreen();
}
