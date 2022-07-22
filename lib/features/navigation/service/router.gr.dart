// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: const EmptyRouterPage());
    },
    TempRouter.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: const EmptyRouterPage());
    },
    TempRoute.name: (routeData) {
      final args = routeData.argsAs<TempRouteArgs>(orElse: () => const TempRouteArgs());
      return MaterialPageX<dynamic>(routeData: routeData, child: TempScreen(key: args.key, wmFactory: args.wmFactory));
    },
    DebugRouter.name: (routeData) {
      final args = routeData.argsAs<DebugRouterArgs>(orElse: () => const DebugRouterArgs());
      return MaterialPageX<dynamic>(routeData: routeData, child: DebugScreen(key: args.key, wmFactory: args.wmFactory));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', children: [
          RouteConfig('#redirect', path: '', parent: HomeRoute.name, redirectTo: 'temp', fullMatch: true),
          RouteConfig(TempRouter.name, path: 'temp', parent: HomeRoute.name, children: [
            RouteConfig(TempRoute.name, path: 'temp-screen', parent: TempRouter.name),
            RouteConfig(DebugRouter.name, path: 'debug', parent: TempRouter.name)
          ])
        ])
      ];
}

/// generated route for
/// [EmptyRouterPage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children}) : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [EmptyRouterPage]
class TempRouter extends PageRouteInfo<void> {
  const TempRouter({List<PageRouteInfo>? children}) : super(TempRouter.name, path: 'temp', initialChildren: children);

  static const String name = 'TempRouter';
}

/// generated route for
/// [TempScreen]
class TempRoute extends PageRouteInfo<TempRouteArgs> {
  TempRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory =
          initScreenWidgetModelFactory})
      : super(TempRoute.name, path: 'temp-screen', args: TempRouteArgs(key: key, wmFactory: wmFactory));

  static const String name = 'TempRoute';
}

class TempRouteArgs {
  const TempRouteArgs({this.key, this.wmFactory = initScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory;

  @override
  String toString() {
    return 'TempRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [DebugScreen]
class DebugRouter extends PageRouteInfo<DebugRouterArgs> {
  DebugRouter(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory =
          debugScreenWidgetModelFactory})
      : super(DebugRouter.name, path: 'debug', args: DebugRouterArgs(key: key, wmFactory: wmFactory));

  static const String name = 'DebugRouter';
}

class DebugRouterArgs {
  const DebugRouterArgs({this.key, this.wmFactory = debugScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory;

  @override
  String toString() {
    return 'DebugRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}
