import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/dash/presentation/screens/dash_screen_export.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug_screen/debug_screen_export.dart';
import 'package:flutter_template/features/debug/presentation/screens/log_history_screen/log_history_export.dart';
import 'package:flutter_template/features/debug/presentation/screens/ui_kit_screen/ui_kit_screen_export.dart';
import 'package:flutter_template/features/info/presentation/screens/info_screen_export.dart';
import 'package:flutter_template/features/navigation/domain/entity/log_history/log_history_routes.dart';
import 'package:flutter_template/features/navigation/domain/entity/temp/temp_routes.dart';
import 'package:flutter_template/features/navigation/domain/entity/ui_kit/ui_kit_routes.dart';
import 'package:flutter_template/features/temp/presentation/temp_screen_entry.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

@AutoRouterConfig(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
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
