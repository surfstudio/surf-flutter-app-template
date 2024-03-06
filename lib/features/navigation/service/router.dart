import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_flow.dart';
import 'package:flutter_template/features/debug/presentation/ui_kit/ui_kit_flow.dart';
import 'package:flutter_template/features/feature_example/presentation/feature_example_flow.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_paths.dart';

part 'router.gr.dart';

/// {@template router.class}
/// Main point of the application navigation.
/// {@endtemplate}
@AutoRouterConfig(
  replaceInRouteName: 'Flow,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: DebugRouter.page,
          path: AppRoutePaths.debugPath,
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
}
