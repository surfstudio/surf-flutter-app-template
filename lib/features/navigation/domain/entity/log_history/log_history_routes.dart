import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/debug/screens/log_history_screen/log_history_export.dart';
import 'package:flutter_template/features/debug/screens/log_history_screen/log_history_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';


/// All routes for the history logs feature.
const logHistoryRoutes = AutoRoute<dynamic>(
  path: AppRoutePaths.logHistory,
  name: AppRouteNames.logHistoryScreen,
  page: LogHistoryScreen,
);
