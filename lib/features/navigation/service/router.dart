import 'package:flutter/material.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_routes.dart';
import 'package:go_router/go_router.dart';

/// Main point of the application navigation.
class AppRouter extends GoRouter {
  /// Creates a new instance of the [AppRouter].
  AppRouter({
    required AppRoutesDelegate delegate,
    PageBuilder? errorPageBuilder,
    RouteWidgetBuilder? errorBuilder,
    GoRouterRedirect? redirect,
    Listenable? refreshListenable,
    int redirectLimit = 5,
    bool routerNeglect = false,
    String initialLocation = '/',
    UrlPathStrategy? urlPathStrategy,
    List<NavigatorObserver>? observers,
    bool debugLogDiagnostics = false,
    NavigatorBuilder? navigatorBuilder,
    String? restorationScopeId,
  }) : super(
          routes: delegate.routeList,
          errorPageBuilder: errorPageBuilder,
          errorBuilder: errorBuilder,
          redirect: redirect,
          refreshListenable: refreshListenable,
          redirectLimit: redirectLimit,
          routerNeglect: routerNeglect,
          initialLocation: initialLocation,
          urlPathStrategy: urlPathStrategy,
          observers: observers,
          debugLogDiagnostics: debugLogDiagnostics,
          navigatorBuilder: navigatorBuilder,
          restorationScopeId: restorationScopeId,
        );
}

/// The signature of the page builder callback for a matched Route.
typedef PageBuilder = Page<void> Function(
  BuildContext context,
  GoRouterState state,
);

/// The signature of the widget builder callback for a matched Route.
typedef RouteWidgetBuilder = Widget Function(
  BuildContext context,
  GoRouterState state,
);

/// The signature of the navigatorBuilder callback.
typedef NavigatorBuilder = Widget Function(
  BuildContext context,
  GoRouterState state,
  Widget child,
);
