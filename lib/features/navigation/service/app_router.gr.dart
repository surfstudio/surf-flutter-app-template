// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
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
    UiKitRouter.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiKitFlow(),
      );
    },
  };
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
/// [UiKitFlow]
class UiKitRouter extends PageRouteInfo<void> {
  const UiKitRouter({List<PageRouteInfo>? children})
      : super(
          UiKitRouter.name,
          initialChildren: children,
        );

  static const String name = 'UiKitRouter';

  static const PageInfo<void> page = PageInfo<void>(name);
}
