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
    TempScreenRoute.name: (routeData) {
      final args = routeData.argsAs<TempScreenRouteArgs>(orElse: () => const TempScreenRouteArgs());
      return MaterialPageX<dynamic>(routeData: routeData, child: TempScreen(key: args.key, wmFactory: args.wmFactory));
    },
    DebugScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DebugScreenRouteArgs>(orElse: () => const DebugScreenRouteArgs());
      return MaterialPageX<dynamic>(routeData: routeData, child: DebugScreen(key: args.key, wmFactory: args.wmFactory));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect', path: '/', redirectTo: '/tempScreen', fullMatch: true),
        RouteConfig(TempScreenRoute.name, path: '/tempScreen'),
        RouteConfig(DebugScreenRoute.name, path: '/debugScreen')
      ];
}

/// generated route for
/// [TempScreen]
class TempScreenRoute extends PageRouteInfo<TempScreenRouteArgs> {
  TempScreenRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory =
          initScreenWidgetModelFactory})
      : super(TempScreenRoute.name, path: '/tempScreen', args: TempScreenRouteArgs(key: key, wmFactory: wmFactory));

  static const String name = 'TempScreenRoute';
}

class TempScreenRouteArgs {
  const TempScreenRouteArgs({this.key, this.wmFactory = initScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory;

  @override
  String toString() {
    return 'TempScreenRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [DebugScreen]
class DebugScreenRoute extends PageRouteInfo<DebugScreenRouteArgs> {
  DebugScreenRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory =
          debugScreenWidgetModelFactory})
      : super(DebugScreenRoute.name, path: '/debugScreen', args: DebugScreenRouteArgs(key: key, wmFactory: wmFactory));

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
