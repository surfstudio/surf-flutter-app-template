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
    TempRouter.name: (routeData) {
      final args = routeData.argsAs<TempRouterArgs>(
          orElse: () => const TempRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: TempScreen(key: args.key, wmFactory: args.wmFactory));
    },
    LogHistoryRouter.name: (routeData) {
      final args = routeData.argsAs<LogHistoryRouterArgs>(
          orElse: () => const LogHistoryRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: LogHistoryScreen(key: args.key, wmFactory: args.wmFactory));
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
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'temp', fullMatch: true),
        RouteConfig(TempRouter.name, path: 'temp', children: [
          RouteConfig('#redirect',
              path: '',
              parent: TempRouter.name,
              redirectTo: 'dash',
              fullMatch: true),
          RouteConfig(DashRouter.name, path: 'dash', parent: TempRouter.name),
          RouteConfig(InfoRouter.name, path: 'info', parent: TempRouter.name),
          RouteConfig(DebugRouter.name, path: 'debug', parent: TempRouter.name)
        ]),
        RouteConfig(LogHistoryRouter.name, path: 'logHistory')
      ];
}

/// generated route for
/// [TempScreen]
class TempRouter extends PageRouteInfo<TempRouterArgs> {
  TempRouter(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          wmFactory = initScreenWidgetModelFactory,
      List<PageRouteInfo>? children})
      : super(TempRouter.name,
            path: 'temp',
            args: TempRouterArgs(key: key, wmFactory: wmFactory),
            initialChildren: children);

  static const String name = 'TempRouter';
}

class TempRouterArgs {
  const TempRouterArgs(
      {this.key, this.wmFactory = initScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'TempRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [LogHistoryScreen]
class LogHistoryRouter extends PageRouteInfo<LogHistoryRouterArgs> {
  LogHistoryRouter(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          wmFactory = logHistoryScreenWmFactory})
      : super(LogHistoryRouter.name,
            path: 'logHistory',
            args: LogHistoryRouterArgs(key: key, wmFactory: wmFactory));

  static const String name = 'LogHistoryRouter';
}

class LogHistoryRouterArgs {
  const LogHistoryRouterArgs(
      {this.key, this.wmFactory = logHistoryScreenWmFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'LogHistoryRouterArgs{key: $key, wmFactory: $wmFactory}';
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
