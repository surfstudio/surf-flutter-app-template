import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/counter/screen/counter_export.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';

/// Рут для экрана счетчика
const counterRoutes = AutoRoute<dynamic>(
  name: AppRouteNames.counterScreen,
  path: AppRoutePaths.counterScreen,
  page: CounterScreen,
);
