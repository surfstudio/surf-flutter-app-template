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
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    TempRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    TempRoute.name: (routeData) {
      final args =
          routeData.argsAs<TempRouteArgs>(orElse: () => const TempRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: TempScreen(key: args.key, wmFactory: args.wmFactory));
    },
    DashRouter.name: (routeData) {
      final args = routeData.argsAs<DashRouterArgs>(
          orElse: () => const DashRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DashScreen(key: args.key, wmFactory: args.wmFactory));
    },
    InfoRouter.name: (routeData) {
      final args = routeData.argsAs<InfoRouterArgs>(
          orElse: () => const InfoRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: InfoScreen(key: args.key, wmFactory: args.wmFactory));
    },
    DebugRouter.name: (routeData) {
      final args = routeData.argsAs<DebugRouterArgs>(
          orElse: () => const DebugRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DebugScreen(key: args.key, wmFactory: args.wmFactory));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', children: [
          RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'temp',
              fullMatch: true),
          RouteConfig(TempRouter.name,
              path: 'temp',
              parent: HomeRoute.name,
              children: [
                RouteConfig(TempRoute.name,
                    path: '',
                    parent: TempRouter.name,
                    children: [
                      RouteConfig('#redirect',
                          path: '',
                          parent: TempRoute.name,
                          redirectTo: 'dash',
                          fullMatch: true),
                      RouteConfig(DashRouter.name,
                          path: 'dash', parent: TempRoute.name),
                      RouteConfig(InfoRouter.name,
                          path: 'info', parent: TempRoute.name),
                      RouteConfig(DebugRouter.name,
                          path: 'debug', parent: TempRoute.name)
                    ])
              ])
        ])
      ];
}

/// generated route for
/// [EmptyRouterPage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [EmptyRouterPage]
class TempRouter extends PageRouteInfo<void> {
  const TempRouter({List<PageRouteInfo>? children})
      : super(TempRouter.name, path: 'temp', initialChildren: children);

  static const String name = 'TempRouter';
}

/// generated route for
/// [TempScreen]
class TempRoute extends PageRouteInfo<TempRouteArgs> {
  TempRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          wmFactory = initScreenWidgetModelFactory,
      List<PageRouteInfo>? children})
      : super(TempRoute.name,
            path: '',
            args: TempRouteArgs(key: key, wmFactory: wmFactory),
            initialChildren: children);

  static const String name = 'TempRoute';
}

class TempRouteArgs {
  const TempRouteArgs(
      {this.key, this.wmFactory = initScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'TempRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [DashScreen]
class DashRouter extends PageRouteInfo<DashRouterArgs> {
  DashRouter(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          wmFactory = dashScreenWmFactory})
      : super(DashRouter.name,
            path: 'dash', args: DashRouterArgs(key: key, wmFactory: wmFactory));

  static const String name = 'DashRouter';
}

class DashRouterArgs {
  const DashRouterArgs({this.key, this.wmFactory = dashScreenWmFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'DashRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [InfoScreen]
class InfoRouter extends PageRouteInfo<InfoRouterArgs> {
  InfoRouter(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          wmFactory = infoScreenWmFactory})
      : super(InfoRouter.name,
            path: 'info', args: InfoRouterArgs(key: key, wmFactory: wmFactory));

  static const String name = 'InfoRouter';
}

class InfoRouterArgs {
  const InfoRouterArgs({this.key, this.wmFactory = infoScreenWmFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'InfoRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [DebugScreen]
class DebugRouter extends PageRouteInfo<DebugRouterArgs> {
  DebugRouter(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          wmFactory = debugScreenWidgetModelFactory})
      : super(DebugRouter.name,
            path: 'debug',
            args: DebugRouterArgs(key: key, wmFactory: wmFactory));

  static const String name = 'DebugRouter';
}

class DebugRouterArgs {
  const DebugRouterArgs(
      {this.key, this.wmFactory = debugScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'DebugRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}
