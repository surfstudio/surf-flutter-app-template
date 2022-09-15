import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/info/screen/info_screen_export.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the info feature.
const infoRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.infoPath,
  name: AppRouteNames.infoScreen,
  page: InfoScreen,
);
