import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/assets/themes/theme_data.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/app/di/app_scope_register.dart';
import 'package:flutter_template/features/common/service/theme/theme_service.dart';
import 'package:flutter_template/features/common/widgets/di_scope/di_scope.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage_impl.dart';

/// App widget.
class App extends StatefulWidget {
  /// Scope of dependencies which need through all app's life.
  final AppScope appScope;

  /// Register and setup third-party dependencies for app DI scope.
  final AppScopeRegister appScopeRegister;

  /// Create an instance App.
  const App({
    required this.appScope,
    required this.appScopeRegister,
    Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;
  late IThemeService _themeService;

  @override
  void initState() {
    super.initState();

    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;

    _themeService = _scope.themeService;

    final configStorage = ConfigSettingsStorageImpl(_scope.sharedPreferences);
    final environment = Environment<AppConfig>.instance();
    if (!environment.isRelease) {
      environment.refreshConfigProxy(configStorage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: AnimatedBuilder(
        animation: _themeService,
        builder: (context, child) {
          return MaterialApp.router(
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: _themeService.currentThemeMode,

            /// Localization.
            locale: _localizations.first,
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _localizations,

            /// This is for navigation.
            routeInformationParser: _scope.router.defaultRouteParser(),
            routerDelegate: _scope.router.delegate(),
          );
        },
      ),
    );
  }

  void _rebuildApplication() {
    widget.appScopeRegister.createScope().then((value) {
      setState(() {
        _scope = value..applicationRebuilder = _rebuildApplication;
      });
    });
  }
}

// You need to customize for your project.
const _localizations = [Locale('ru', 'RU')];

const _localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
