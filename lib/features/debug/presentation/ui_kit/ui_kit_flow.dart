import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/presentation/ui_kit/ui_kit_screen.dart';

/// {@template ui_kit_flow.class}
/// Entry of Ui Kit screen.
/// {@endtemplate}
@RoutePage()
class UiKitFlow extends StatelessWidget {
  /// {@macro ui_kit_flow.class}
  const UiKitFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiKitScreen();
  }
}
