import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/dash/presentation/dash_flow.dart';
import 'package:flutter_template/features/debug/presentation/debug_flow.dart';
import 'package:flutter_template/features/debug/presentation/screens/ui_kit/ui_kit_screen.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_flow.dart';
import 'package:flutter_template/features/info/presentation/info_flow.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';
import 'package:flutter_template/features/temp/presentation/temp_flow.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// Main point of the application navigation.
@AutoRouterConfig(
  replaceInRouteName: 'Flow,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: TempRouter.page,
          initial: true,
          path: AppRoutePaths.tempPath,
          children: [
            AutoRoute(
              page: DashRouter.page,
              path: AppRoutePaths.dashPath,
            ),
            AutoRoute(
              page: InfoRouter.page,
              path: AppRoutePaths.infoPath,
            ),
            AutoRoute(
              page: DebugRouter.page,
              path: AppRoutePaths.debugPath,
            ),
          ],
        ),
        AutoRoute(
          page: UiKitRouter.page,
          path: AppRoutePaths.uiKitPath,
        ),
        AutoRoute(
          path: AppRoutePaths.featureExample,
          page: FeatureExampleRoute.page,
        ),
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
