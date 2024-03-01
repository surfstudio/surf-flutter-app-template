import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/app/app.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_listener.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

/// {@template app_flow.class}
/// Entry point for the application.
/// {@endtemplate}
class AppFlow extends StatelessWidget {
  /// {@macro app_scope.class}
  final IAppScope appScope;

  /// {@macro app_flow.class}
  const AppFlow({
    required this.appScope,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: [
        DiScope<IAppScope>(factory: (_) => appScope),
        ChangeNotifierProvider<AppRouter>(create: (_) => AppRouter()),
        const ThemeModeListener(),
      ],
      child: const App(),
    );
  }
}
