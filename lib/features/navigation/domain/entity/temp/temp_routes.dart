import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/navigation/domain/entity/debug/debug_routes.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen_export.dart';

/// All routes for the temp feature.
const tempRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.tempScreen,
  name: AppRouteNames.tempScreen,
  page: EmptyRouterPage,
  children: [
    AutoRoute<dynamic>(
      page: TempScreen,
    ),
    debugRoutes,
  ],
);
