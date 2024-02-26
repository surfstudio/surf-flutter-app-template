import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/mixin/theme_mixin.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/temp/di/temp_scope.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp/temp_model.dart';
import 'package:flutter_template/features/temp/presentation/screens/temp/temp_screen.dart';
import 'package:flutter_template/l10n/app_localizations_x.dart';
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
    with ThemeWMMixin
    implements ITempWidgetModel {
  late final List<BottomNavigationBarItem> _defaultNavBarItems;

  late final BottomNavigationBarItem _debugNavBarItem;

  @override
  void initWidgetModel() {
    _defaultNavBarItems = [
      BottomNavigationBarItem(
        label: context.l10n.dashScreenNavBarItemLabel,
        icon: const Icon(Icons.flutter_dash),
      ),
    ];
    _debugNavBarItem = BottomNavigationBarItem(
      label: context.l10n.debugScreenNavBarItemLabel,
      icon: const Icon(Icons.bug_report_outlined),
    );
    super.initWidgetModel();
  }

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _navigationBarItems;

  List<PageRouteInfo> get _routes {
    final defaultRoutes = <PageRouteInfo>[const DashRouter()];
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

/// Interface for [TempWidgetModel].
abstract class ITempWidgetModel with ThemeIModelMixin implements IWidgetModel {
  /// Routes for [AutoTabsRouter.tabBar].
  List<PageRouteInfo<dynamic>> get routes;

  /// Items for [BottomNavigationBar].
  List<BottomNavigationBarItem> get navigationBarItems;

  /// Title for appbar, depends on current selected page.
  String appBarTitle(RouteData topRoute);

  /// Switch theme mode between light and dark.
  void switchTheme();
}
