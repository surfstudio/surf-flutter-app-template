// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashRouter.name: (routeData) {
      final args = routeData.argsAs<DashRouterArgs>(
          orElse: () => const DashRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DashScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    DebugRouter.name: (routeData) {
      final args = routeData.argsAs<DebugRouterArgs>(
          orElse: () => const DebugRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DebugScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    InfoRouter.name: (routeData) {
      final args = routeData.argsAs<InfoRouterArgs>(
          orElse: () => const InfoRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InfoScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    LogHistoryRouter.name: (routeData) {
      final args = routeData.argsAs<LogHistoryRouterArgs>(
          orElse: () => const LogHistoryRouterArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LogHistoryScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    TempRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TemplateEntry()),
      );
    },
    UiKitRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiKitScreen(),
      );
    },
  };
}

/// generated route for
/// [DashScreen]
class DashRouter extends PageRouteInfo<DashRouterArgs> {
  DashRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = dashScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          DashRouter.name,
          args: DashRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'DashRouter';

  static const PageInfo<DashRouterArgs> page = PageInfo<DashRouterArgs>(name);
}

class DashRouterArgs {
  const DashRouterArgs({
    this.key,
    this.wmFactory = dashScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'DashRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [DebugScreen]
class DebugRouter extends PageRouteInfo<DebugRouterArgs> {
  DebugRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = debugScreenWidgetModelFactory,
    List<PageRouteInfo>? children,
  }) : super(
          DebugRouter.name,
          args: DebugRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'DebugRouter';

  static const PageInfo<DebugRouterArgs> page = PageInfo<DebugRouterArgs>(name);
}

class DebugRouterArgs {
  const DebugRouterArgs({
    this.key,
    this.wmFactory = debugScreenWidgetModelFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'DebugRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [InfoScreen]
class InfoRouter extends PageRouteInfo<InfoRouterArgs> {
  InfoRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = infoScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          InfoRouter.name,
          args: InfoRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'InfoRouter';

  static const PageInfo<InfoRouterArgs> page = PageInfo<InfoRouterArgs>(name);
}

class InfoRouterArgs {
  const InfoRouterArgs({
    this.key,
    this.wmFactory = infoScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'InfoRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [LogHistoryScreen]
class LogHistoryRouter extends PageRouteInfo<LogHistoryRouterArgs> {
  LogHistoryRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = logHistoryScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          LogHistoryRouter.name,
          args: LogHistoryRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'LogHistoryRouter';

  static const PageInfo<LogHistoryRouterArgs> page =
      PageInfo<LogHistoryRouterArgs>(name);
}

class LogHistoryRouterArgs {
  const LogHistoryRouterArgs({
    this.key,
    this.wmFactory = logHistoryScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'LogHistoryRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [TemplateEntry]
class TempRouter extends PageRouteInfo<void> {
  const TempRouter({List<PageRouteInfo>? children})
      : super(
          TempRouter.name,
          initialChildren: children,
        );

  static const String name = 'TempRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UiKitScreen]
class UiKitRouter extends PageRouteInfo<void> {
  const UiKitRouter({List<PageRouteInfo>? children})
      : super(
          UiKitRouter.name,
          initialChildren: children,
        );

  static const String name = 'UiKitRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}
