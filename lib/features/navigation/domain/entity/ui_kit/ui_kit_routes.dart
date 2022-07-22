import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/debug/screens/ui_kit/ui_kit_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';

/// Рут для экрана UIKitScreen
const uiKitRoutes = AutoRoute<dynamic>(
  name: AppRouteNames.uiKitScreen,
  path: AppRoutePaths.uiKitScreen,
  page: EmptyRouterPage,
  children: [
    AutoRoute<dynamic>(
      path: '',
      page: UIKitScreen,
    ),
  ],
);
