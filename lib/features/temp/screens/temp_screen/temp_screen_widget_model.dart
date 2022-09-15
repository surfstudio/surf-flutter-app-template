import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen_model.dart';

/// Factory for [TempScreenWidgetModel].
TempScreenWidgetModel initScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = TempScreenModel(Environment<AppConfig>.instance());
  return TempScreenWidgetModel(model);
}

/// Widget model for [TempScreen].
class TempScreenWidgetModel extends WidgetModel<TempScreen, ITempScreenModel>
    implements IDebugWidgetModel {
  @override
  bool get isDebugMode => model.isDebugMode;

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navigationBarItems;

  List<PageRouteInfo> get _routes {
    return isDebugMode ? [DebugRouter()] : [DashRouter(), InfoRouter()];
  }

  List<BottomNavigationBarItem> get _navigationBarItems {
    return [
      const BottomNavigationBarItem(
        label: 'Dash screen',
        icon: Icon(Icons.flutter_dash),
      ),
      const BottomNavigationBarItem(
        label: 'Info screen',
        icon: Icon(Icons.info_outline),
      ),
    ];
  }

  /// Create an instance [TempScreenWidgetModel].
  TempScreenWidgetModel(ITempScreenModel model) : super(model);

  @override
  String appBarTitle(RouteData topRoute) => _appBarTitle(topRoute);

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
abstract class IDebugWidgetModel extends IWidgetModel {
  /// Return value for app environment status.
  bool get isDebugMode;

  /// Routes for [AutoTabsRouter.tabBar].
  List<PageRouteInfo<dynamic>> get routes;

  /// Items for [BottomNavigationBar].
  List<BottomNavigationBarItem> get navigationBarItems;

  /// Title for appbar, depends on current selected page.
  String appBarTitle(RouteData topRoute);
}
