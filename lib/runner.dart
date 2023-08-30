import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/app.dart';
import 'package:flutter_template/features/app/di/app_scope_register.dart';
import 'package:surf_logger/surf_logger.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  final fbOptions = Environment.instance().firebaseOptions;

  if (fbOptions != null) {
    await Firebase.initializeApp(options: fbOptions);
  }

  /// Fix orientation.
  // TODO(init-project): change as needed or remove.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // TODO(init-project): Initialize Crashlytics.
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //
  //   return true;
  // };

  _initLogger();
  await _runApp();
}

Future<void> _runApp() async {
  final scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope();
  await scope.initTheme();
  runApp(App(scope));
}

void _initLogger() {
  // TODO(init-project): Initialize CrashlyticsRemoteLogStrategy.
  // RemoteLogger.addStrategy(CrashlyticsRemoteLogStrategy());
  Logger.addStrategy(DebugLogStrategy());
  Logger.addStrategy(RemoteLogStrategy());
}
