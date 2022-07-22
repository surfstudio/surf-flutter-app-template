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
      return CustomPage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage(), opaque: true, barrierDismissible: false);
    },
    TempScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage(), opaque: true, barrierDismissible: false);
    },
    CounterScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CounterScreenRouteArgs>(orElse: () => const CounterScreenRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: CounterScreen(wmFactory: args.wmFactory, key: args.key),
          opaque: true,
          barrierDismissible: false);
    },
    DebugScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage(), opaque: true, barrierDismissible: false);
    },
    UiKitScreen.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage(), opaque: true, barrierDismissible: false);
    },
    TempRoute.name: (routeData) {
      final args = routeData.argsAs<TempRouteArgs>(orElse: () => const TempRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: TempScreen(key: args.key, wmFactory: args.wmFactory),
          opaque: true,
          barrierDismissible: false);
    },
    DebugRoute.name: (routeData) {
      final args = routeData.argsAs<DebugRouteArgs>(orElse: () => const DebugRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: DebugScreen(key: args.key, wmFactory: args.wmFactory),
          opaque: true,
          barrierDismissible: false);
    },
    UIKitRoute.name: (routeData) {
      final args = routeData.argsAs<UIKitRouteArgs>(orElse: () => const UIKitRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: UIKitScreen(wmFactory: args.wmFactory, key: args.key),
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', children: [
          RouteConfig('#redirect', path: '', parent: HomeRoute.name, redirectTo: 'tempScreen', fullMatch: true),
          RouteConfig(TempScreenRoute.name, path: 'tempScreen', parent: HomeRoute.name, children: [
            RouteConfig(TempRoute.name, path: '', parent: TempScreenRoute.name, children: [
              RouteConfig(DebugScreenRoute.name, path: 'debugScreen', parent: TempRoute.name, children: [
                RouteConfig(DebugRoute.name, path: '', parent: DebugScreenRoute.name),
                RouteConfig(UiKitScreen.name,
                    path: 'uiKitScreen',
                    parent: DebugScreenRoute.name,
                    children: [RouteConfig(UIKitRoute.name, path: '', parent: UiKitScreen.name)])
              ]),
              RouteConfig(CounterScreenRoute.name, path: 'counterScreen', parent: TempRoute.name)
            ])
          ]),
          RouteConfig(CounterScreenRoute.name, path: 'counterScreen', parent: HomeRoute.name),
          RouteConfig(DebugScreenRoute.name, path: 'debugScreen', parent: HomeRoute.name, children: [
            RouteConfig(DebugRoute.name, path: '', parent: DebugScreenRoute.name),
            RouteConfig(UiKitScreen.name,
                path: 'uiKitScreen',
                parent: DebugScreenRoute.name,
                children: [RouteConfig(UIKitRoute.name, path: '', parent: UiKitScreen.name)])
          ]),
          RouteConfig(UiKitScreen.name,
              path: 'uiKitScreen',
              parent: HomeRoute.name,
              children: [RouteConfig(UIKitRoute.name, path: '', parent: UiKitScreen.name)])
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
/// [CounterScreen]
class CounterScreenRoute extends PageRouteInfo<CounterScreenRouteArgs> {
  CounterScreenRoute(
      {WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory = defaultCounterWm,
      Key? key})
      : super(CounterScreenRoute.name,
            path: 'counterScreen', args: CounterScreenRouteArgs(wmFactory: wmFactory, key: key));

  static const String name = 'CounterScreenRoute';
}

class CounterScreenRouteArgs {
  const CounterScreenRouteArgs({this.wmFactory = defaultCounterWm, this.key});

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory;

  final Key? key;

  @override
  String toString() {
    return 'CounterScreenRouteArgs{wmFactory: $wmFactory, key: $key}';
  }
}

/// generated route for
/// [EmptyRouterPage]
class DebugScreenRoute extends PageRouteInfo<void> {
  const DebugScreenRoute({List<PageRouteInfo>? children})
      : super(DebugScreenRoute.name, path: 'debugScreen', initialChildren: children);

  static const String name = 'DebugScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class UiKitScreen extends PageRouteInfo<void> {
  const UiKitScreen({List<PageRouteInfo>? children})
      : super(UiKitScreen.name, path: 'uiKitScreen', initialChildren: children);

  static const String name = 'UiKitScreen';
}

/// generated route for
/// [TempScreen]
class TempRoute extends PageRouteInfo<TempRouteArgs> {
  TempRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory =
          initScreenWidgetModelFactory,
      List<PageRouteInfo>? children})
      : super(TempRoute.name, path: '', args: TempRouteArgs(key: key, wmFactory: wmFactory), initialChildren: children);

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
class DebugRoute extends PageRouteInfo<DebugRouteArgs> {
  DebugRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory =
          debugScreenWidgetModelFactory})
      : super(DebugRoute.name, path: '', args: DebugRouteArgs(key: key, wmFactory: wmFactory));

  static const String name = 'DebugRoute';
}

class DebugRouteArgs {
  const DebugRouteArgs({this.key, this.wmFactory = debugScreenWidgetModelFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory;

  @override
  String toString() {
    return 'DebugRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [UIKitScreen]
class UIKitRoute extends PageRouteInfo<UIKitRouteArgs> {
  UIKitRoute(
      {WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory = defaultUIKitWm,
      Key? key})
      : super(UIKitRoute.name, path: '', args: UIKitRouteArgs(wmFactory: wmFactory, key: key));

  static const String name = 'UIKitRoute';
}

class UIKitRouteArgs {
  const UIKitRouteArgs({this.wmFactory = defaultUIKitWm, this.key});

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(BuildContext) wmFactory;

  final Key? key;

  @override
  String toString() {
    return 'UIKitRouteArgs{wmFactory: $wmFactory, key: $key}';
  }
}
