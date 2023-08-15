import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/app/app.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:surf_logger/surf_logger.dart';

/// App launch.
Future<void> run() async {
  /// It must be called so that the orientation does not fall.
  WidgetsFlutterBinding.ensureInitialized();

  /// Fix orientation.
  // TODO(init-project): change as needed or remove.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // TODO(init-project): Initialize Crashlytics.
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

  _initLogger();
  await _runApp();
}

Future<void> _runApp() async {
  final scope = AppScope();
  await scope.initTheme();
  runApp(App(scope));
}

void _initLogger() {
  // TODO(init-project): Initialize CrashlyticsRemoteLogStrategy.
  // RemoteLogger.addStrategy(CrashlyticsRemoteLogStrategy());
  Logger.addStrategy(DebugLogStrategy());
  Logger.addStrategy(RemoteLogStrategy());
}
