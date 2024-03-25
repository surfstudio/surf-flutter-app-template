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
    DebugRoute.name: (routeData) {
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
    UiKitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UiKitFlow(),
      );
    },
  };
}

/// generated route for
/// [DebugFlow]
class DebugRoute extends PageRouteInfo<void> {
  const DebugRoute({List<PageRouteInfo>? children})
      : super(
          DebugRoute.name,
          initialChildren: children,
        );

  static const String name = 'DebugRoute';

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
class UiKitRoute extends PageRouteInfo<void> {
  const UiKitRoute({List<PageRouteInfo>? children})
      : super(
          UiKitRoute.name,
          initialChildren: children,
        );

  static const String name = 'UiKitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
