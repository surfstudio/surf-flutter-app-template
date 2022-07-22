import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/counter/screen/counter_export.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen_export.dart';
import 'package:flutter_template/features/debug/screens/ui_kit/ui_kit_export.dart';
import 'package:flutter_template/features/navigation/domain/entity/counter/counter_routes.dart';
import 'package:flutter_template/features/navigation/domain/entity/debug/debug_routes.dart';
import 'package:flutter_template/features/navigation/domain/entity/temp/temp_routes.dart';
import 'package:flutter_template/features/navigation/domain/entity/ui_kit/ui_kit_routes.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen_export.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// All app routes
@CustomAutoRouter(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      name: 'homeRoute',
      page: EmptyRouterPage,
      path: '/',
      children: [
        tempRoutes,
        counterRoutes,
        debugRoutes,
        uiKitRoutes,
      ],
    ),
  ],
)

/// Main point of the application navigation
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  AppRouter._();

  /// Singleton instance of [AppRouter]
  factory AppRouter.instance() => _router;
}
