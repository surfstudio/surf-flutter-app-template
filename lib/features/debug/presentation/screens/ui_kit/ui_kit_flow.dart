import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_screen.dart';
import 'package:flutter_template/features/navigation/domain/entity/app_route_names.dart';

/// {@template ui_kit_flow.class}
/// Entry of Ui Kit screen.
/// {@endtemplate}
@RoutePage(name: AppRouteNames.uiKitScreen)
class UiKitFlow extends StatelessWidget {
  /// {@macro ui_kit_flow.class}
  const UiKitFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const DebugScreen();
  }
}
