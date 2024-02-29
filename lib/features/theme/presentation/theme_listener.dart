import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/theme/di/theme_scope.dart';
import 'package:flutter_template/features/theme/presentation/theme_widget.dart';
import 'package:nested/nested.dart';

/// {@template theme_listener.class}
/// Theme listener.
/// {@endtemplate}
class ThemeListener extends SingleChildStatelessWidget {
  /// {@macro theme_listener.class}
  const ThemeListener({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return DiScope<IThemeScope>(
      factory: ThemeScope.create,
      dispose: (scope) => scope.dispose(),
      child: ThemeWidget(child: child ?? const SizedBox.shrink()),
    );
  }
}
