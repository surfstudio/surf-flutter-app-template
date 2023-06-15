import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/navigation/service/router.dart';

/// All routes for the history logs feature.
final logHistoryRoutes = AutoRoute(
  page: LogHistoryRouter.page,
  path: AppRoutePaths.logHistory,
);
