import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/navigation/domain/entity/log_history/log_history_routes.dart';
import 'package:flutter_template/features/navigation/domain/entity/temp/temp_routes.dart';
import 'package:flutter_template/features/navigation/domain/entity/ui_kit/ui_kit_routes.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

@AutoRouterConfig(
  replaceInRouteName: 'Flow,Route',
)

/// Main point of the application navigation.
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        tempRoutes,
        logHistoryRoutes,
        uiKitRoutes,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
