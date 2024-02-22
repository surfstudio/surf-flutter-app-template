import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/common/service/theme/theme_service.dart';
import 'package:flutter_template/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_settings_storage.dart';
import 'package:flutter_template/uikit/themes/theme_data.dart';

/// App widget.
class App extends StatefulWidget {
  /// Create an instance App.
  const App(this.appScope, {super.key});

  /// Scope of dependencies which need through all app's life.
  final AppScope appScope;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;
  late IThemeService _themeService;

  @override
  void initState() {
    super.initState();

    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    _themeService = _scope.themeService;

    final environment = Environment.instance();
    if (!environment.isRelease) {
      final configStorage = ConfigSettingsStorage(_scope.sharedPreferences);

      environment
        ..refreshConfigProxy(configStorage).ignore()
        ..createLogHistoryStrategy().ignore();
    }
  }

  @override
  void dispose() {
    _themeService.dispose();
    super.dispose();
  }

  void _rebuildApplication() {
    setState(() {
      _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      onFactory: () {
        return _scope;
      },
      key: ObjectKey(_scope),
      child: AnimatedBuilder(
        animation: _themeService,
        builder: (_, child) {
          return MaterialApp.router(
            /// This is for navigation.
            routeInformationParser: _scope.router.defaultRouteParser(),
            routerDelegate: _scope.router.delegate(),
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: _themeService.currentThemeMode,

            /// Localization.
            locale: _localizations.firstOrNull,
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _localizations,
          );
        },
      ),
    );
  }
}

const _localizations = [
  Locale('ru', 'RU'),
];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
