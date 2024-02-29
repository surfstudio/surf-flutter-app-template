import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/navigation/service/router.dart';
import 'package:flutter_template/features/theme/presentation/theme_listener.dart';
import 'package:flutter_template/features/theme/presentation/theme_wm.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:flutter_template/uikit/themes/theme_data.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

/// {@template app.class}
/// Application
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app.class}
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final IAppScope _scope;
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();

    _scope = context.read<IAppScope>();
    _appRouter = context.read<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: (_) => _scope,
      child: Nested(
        children: const [ThemeListener()],
        child: Builder(
          builder: (context) {
            final themeModeListenable = context.watch<IThemeWM>().themeMode;

            return ValueListenableBuilder(
              valueListenable: themeModeListenable,
              builder: (_, themeMode, __) => MaterialApp.router(
                theme: AppThemeData.lightTheme,
                darkTheme: AppThemeData.darkTheme,
                themeMode: themeMode,

                /// Localization.
                locale: _localizations.first,
                localizationsDelegates: _localizationsDelegates,
                supportedLocales: _localizations,

                /// Navigation.
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.delegate(),
              ),
            );
          },
        ),
      ),
    );
  }
}

const _localizations = [
  Locale('en', 'EN'),
  Locale('ru', 'RU'),
];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
