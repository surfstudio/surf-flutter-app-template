import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/theme/presentation/theme_flow.dart';
import 'package:flutter_template/features/theme/presentation/theme_provider.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage_impl.dart';
import 'package:flutter_template/uikit/themes/theme_data.dart';
import 'package:nested/nested.dart';

/// App widget.
class App extends StatefulWidget {
  /// Scope of dependencies which need through all app's life.
  final AppScope appScope;

  /// Create an instance App.
  const App(this.appScope, {super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;

  @override
  void initState() {
    super.initState();

    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;

    final configStorage = ConfigSettingsStorageImpl(_scope.sharedPreferences);
    final environment = Environment.instance();
    if (!environment.isRelease) {
      environment.refreshConfigProxy(configStorage);
    }
  }

  void _rebuildApplication() {
    setState(() {
      _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: Nested(
        children: const [ThemeListener()],
        child: Builder(
          builder: (context) {
            final themeMode = ThemeProvider.watch(context)?.themeMode;

            return MaterialApp.router(
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: themeMode,

              /// Localization.
              localizationsDelegates: _localizationsDelegates,
              supportedLocales: _localizations,

              /// This is for navigation.
              routeInformationParser: _scope.router.defaultRouteParser(),
              routerDelegate: _scope.router.delegate(),
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
