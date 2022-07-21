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
    TempScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: const EmptyRouterPage());
    },
    TempRoute.name: (routeData) {
      final args = routeData.argsAs<TempRouteArgs>(orElse: () => const TempRouteArgs());
      return MaterialPageX<dynamic>(routeData: routeData, child: TempScreen(key: args.key, wmFactory: args.wmFactory));
    },
    DebugScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DebugScreenRouteArgs>(orElse: () => const DebugScreenRouteArgs());
      return MaterialPageX<dynamic>(routeData: routeData, child: DebugScreen(key: args.key, wmFactory: args.wmFactory));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', children: [
          RouteConfig('#redirect', path: '', parent: HomeRoute.name, redirectTo: 'tempScreen', fullMatch: true),
          RouteConfig(TempScreenRoute.name, path: 'tempScreen', parent: HomeRoute.name, children: [
            RouteConfig(TempRoute.name, path: 'temp-screen', parent: TempScreenRoute.name),
            RouteConfig(DebugScreenRoute.name, path: 'debugScreen', parent: TempScreenRoute.name)
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
class TempScreenRoute extends PageRouteInfo<void> {
  const TempScreenRoute({List<PageRouteInfo>? children})
      : super(TempScreenRoute.name, path: 'tempScreen', initialChildren: children);

  static const String name = 'TempScreenRoute';
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
class DebugScreenRoute extends PageRouteInfo<DebugScreenRouteArgs> {
  DebugScreenRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory =
          debugScreenWidgetModelFactory})
      : super(DebugScreenRoute.name, path: 'debugScreen', args: DebugScreenRouteArgs(key: key, wmFactory: wmFactory));

  static const String name = 'DebugScreenRoute';
}

class DebugScreenRouteArgs {
  const DebugScreenRouteArgs({this.key, this.wmFactory = debugScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory;

  @override
  String toString() {
    return 'DebugScreenRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}
