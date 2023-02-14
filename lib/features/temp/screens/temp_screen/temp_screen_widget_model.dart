import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/common/mixin/theme_mixin.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen_model.dart';
import 'package:provider/provider.dart';

/// Factory for [TempScreenWidgetModel].
TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();

  final model = TempScreenModel(
    Environment<AppConfig>.instance(),
    appScope.themeService,
  );

  return TempScreenWidgetModel(model);
}

/// Widget model for [TempScreen].
class TempScreenWidgetModel extends WidgetModel<TempScreen, ITempScreenModel>
    with ThemeWMMixin
    implements IDebugWidgetModel {
  final _defaultNavBarItems = [
    const BottomNavigationBarItem(
      label: 'Dash screen',
      icon: Icon(Icons.flutter_dash),
    ),
    const BottomNavigationBarItem(
      label: 'Info screen',
      icon: Icon(Icons.info_outline),
    ),
  ];

  final _debugNavBarItem = const BottomNavigationBarItem(
    label: 'Debug screen',
    icon: Icon(Icons.bug_report_outlined),
  );

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navigationBarItems;

  List<PageRouteInfo> get _routes {
    final defaultRoutes = <PageRouteInfo>[DashRouter(), InfoRouter()];
    if (_isDebugMode) defaultRoutes.add(DebugRouter());
    return defaultRoutes;
  }

  List<BottomNavigationBarItem> get _navigationBarItems {
    final navBarItems = [..._defaultNavBarItems];
    if (_isDebugMode) navBarItems.add(_debugNavBarItem);
    return navBarItems;
  }

  bool get _isDebugMode => model.isDebugMode;

  /// Create an instance [TempScreenWidgetModel].
  TempScreenWidgetModel(ITempScreenModel model) : super(model);

  @override
  String appBarTitle(RouteData topRoute) => _appBarTitle(topRoute);

  @override
  void switchTheme() => model.switchTheme();

  String _appBarTitle(RouteData topRoute) {
    switch (topRoute.path) {
      case AppRoutePaths.debugPath:
        return 'Экран отладки';
      case AppRoutePaths.dashPath:
        return 'Dash';
      case AppRoutePaths.infoPath:
        return 'Info';
      default:
        return '';
    }
  }
}

/// Interface of [TempScreenWidgetModel].
abstract class IDebugWidgetModel extends IWidgetModel with ThemeIModelMixin {
  /// Routes for [AutoTabsRouter.tabBar].
  List<PageRouteInfo<dynamic>> get routes;

  /// Items for [BottomNavigationBar].
  List<BottomNavigationBarItem> get navigationBarItems;

  /// Title for appbar, depends on current selected page.
  String appBarTitle(RouteData topRoute);

  /// Switch theme mode between light and dark
  void switchTheme();
}
