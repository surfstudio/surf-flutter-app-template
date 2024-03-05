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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DashFlow()),
      );
    },
    DebugRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const DebugFlow()),
      );
    },
    FeatureExampleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const FeatureExampleFlow()),
      );
    },
    InfoRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const InfoFlow()),
      );
    },
    TempRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TempFlow()),
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
/// [DashFlow]
class DashRouter extends PageRouteInfo<void> {
  const DashRouter({List<PageRouteInfo>? children})
      : super(
          DashRouter.name,
          initialChildren: children,
        );

  static const String name = 'DashRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DebugFlow]
class DebugRouter extends PageRouteInfo<void> {
  const DebugRouter({List<PageRouteInfo>? children})
      : super(
          DebugRouter.name,
          initialChildren: children,
        );

  static const String name = 'DebugRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeatureExampleFlow]
class FeatureExampleRoute extends PageRouteInfo<void> {
  const FeatureExampleRoute({List<PageRouteInfo>? children})
      : super(
          FeatureExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeatureExampleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoFlow]
class InfoRouter extends PageRouteInfo<void> {
  const InfoRouter({List<PageRouteInfo>? children})
      : super(
          InfoRouter.name,
          initialChildren: children,
        );

  static const String name = 'InfoRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TempFlow]
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
