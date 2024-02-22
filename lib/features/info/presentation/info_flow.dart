import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/features/info/di/info_scope.dart';
import 'package:flutter_template/features/info/presentation/screens/info/info_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// {@template info_flow.class}
/// Entry of info feature.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.infoScreen)
class InfoFlow extends StatelessWidget implements AutoRouteWrapper {
  /// {@macro info_flow.class}
  const InfoFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return DiScope<IInfoScope>(
      onFactory: InfoScope.create,
      onDispose: (scope) => scope.dispose(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const InfoScreen();
  }
}
