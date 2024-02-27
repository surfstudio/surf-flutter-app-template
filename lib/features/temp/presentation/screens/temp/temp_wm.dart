import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/localization_mixin.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/utils/mixin/theme_wm_mixin.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/navigation/service/app_router.dart';
import 'package:flutter_template/features/temp/di/temp_scope.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp/temp_model.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp/temp_screen.dart';
import 'package:provider/provider.dart';

/// Factory for [TempWidgetModel].
TempWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final tempScope = context.read<ITempScope>();

  final model = TempModel(
    Environment.instance(),
    appScope.themeService,
    tempScope.templateRepository,
  );

  return TempWidgetModel(model);
}

/// Widget model for [TempScreen].
class TempWidgetModel extends WidgetModel<TempScreen, ITempModel>
    with LocalizationMixin, ThemeWMMixin
    implements ITempWidgetModel {
  late final List<BottomNavigationBarItem> _defaultNavBarItems;

  late final BottomNavigationBarItem _debugNavBarItem;

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navigationBarItems;

  List<PageRouteInfo> get _routes {
    final defaultRoutes = <PageRouteInfo>[const DashRouter(), const InfoRouter()];
    if (_isDebugMode) defaultRoutes.add(const DebugRouter());

    return defaultRoutes;
  }

  List<BottomNavigationBarItem> get _navigationBarItems {
    final navBarItems = [..._defaultNavBarItems];
    if (_isDebugMode) navBarItems.add(_debugNavBarItem);

    return navBarItems;
  }

  bool get _isDebugMode => model.isDebugMode;

  /// Create an instance [TempWidgetModel].
  TempWidgetModel(super._model);

  @override
  void initWidgetModel() {
    _defaultNavBarItems = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.flutter_dash),
        label: l10n.tempScreenDashNavBarItemLabel,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.info_outline),
        label: l10n.tempScreenInfoNavBarItemLabel,
      ),
    ];
    _debugNavBarItem = BottomNavigationBarItem(
      icon: const Icon(Icons.bug_report_outlined),
      label: l10n.tempScreenDebugNavBarItemLabel,
    );
    super.initWidgetModel();
  }

  @override
  String appBarTitle(RouteData topRoute) => _appBarTitle(topRoute);

  @override
  void switchTheme() => model.switchTheme();

  String _appBarTitle(RouteData topRoute) {
    switch (topRoute.path) {
      case AppRoutePaths.debugPath:
        return l10n.tempScreenDebugNavBarItemLabel;
      case AppRoutePaths.dashPath:
        return l10n.tempScreenDashNavBarItemLabel;
      case AppRoutePaths.infoPath:
        return l10n.tempScreenInfoNavBarItemLabel;
      default:
        return '';
    }
  }
}

/// Interface for [TempWidgetModel].
abstract class ITempWidgetModel with ILocalizationMixin, ThemeIModelMixin implements IWidgetModel {
  /// Routes for [AutoTabsRouter.tabBar].
  // ignore: avoid-dynamic
  List<PageRouteInfo<dynamic>> get routes;

  /// Items for [BottomNavigationBar].
  List<BottomNavigationBarItem> get navigationBarItems;

  /// Title for appbar, depends on current selected page.
  String appBarTitle(RouteData topRoute);

  /// Switch theme mode between light and dark.
  void switchTheme();
}
