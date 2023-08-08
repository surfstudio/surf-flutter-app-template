import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/app/app.dart';
import 'package:flutter_template/features/app/di/app_scope_register.dart';
import 'package:surf_logger/surf_logger.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  /// Fix orientation.
  // TODO(init-project): change as needed or remove.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  _initLogger();
  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async {
      final scopeRegister = AppScopeRegister();
      final scope = await scopeRegister.createScope();
      await scope.initTheme();
      runApp(App(scope));
    },
    (exception, stack) {
      // TODO(init-project): Инициализировать Crashlytics.
      // FirebaseCrashlytics.instance.recordError(exception, stack);
    },
  );
}

void _initLogger() {
  // TODO(init-project): Инициализировать CrashlyticsRemoteLogStrategy.
  // RemoteLogger.addStrategy(CrashlyticsRemoteLogStrategy());
  Logger.addStrategy(DebugLogStrategy());
  Logger.addStrategy(RemoteLogStrategy());
}
