import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/theme_mode/di/theme_mode_scope.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_widget.dart';
import 'package:nested/nested.dart';

/// {@template theme_listener.class}
/// Theme listener.
/// {@endtemplate}
class ThemeModeListener extends SingleChildStatelessWidget {
  /// {@macro theme_listener.class}
  const ThemeModeListener({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return DiScope<IThemeModeScope>(
      factory: ThemeModeScope.create,
      dispose: (scope) => scope.dispose(),
      child: ThemeModeWidget(child: child ?? const SizedBox.shrink()),
    );
  }
}
