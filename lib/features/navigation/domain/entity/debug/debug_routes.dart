import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/navigation/domain/entity/ui_kit/ui_kit_routes.dart';

/// All routes for the debug feature.
const debugRoutes = AutoRoute<dynamic>(
  path: AppRoutePaths.debugScreen,
  name: AppRouteNames.debugScreen,
  page: EmptyRouterPage,
  children: [
    AutoRoute<dynamic>(
      path: '',
      page: DebugScreen,
    ),
    uiKitRoutes,
  ],
);
