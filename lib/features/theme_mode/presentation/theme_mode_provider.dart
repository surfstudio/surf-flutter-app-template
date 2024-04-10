import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/theme_mode/di/theme_mode_scope.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_controller.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_widget.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

/// {@template theme_listener.class}
/// Provides [ThemeModeController] to its descendants.
/// {@endtemplate}
class ThemeModeProvider extends SingleChildStatelessWidget {
  /// {@macro theme_listener.class}
  const ThemeModeProvider({super.key});

  /// Get the [ThemeModeController] from the [BuildContext].
  // ignore: prefer-widget-private-members
  static ThemeModeController of(BuildContext context) => Provider.of<ThemeModeController>(context, listen: false);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return DiScope<IThemeModeScope>(
      factory: ThemeModeScope.create,
      onDispose: (scope) => scope.dispose(),
      child: ThemeModeWidget(child: child ?? const SizedBox.shrink()),
    );
  }
}
