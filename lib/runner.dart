import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/features/app/app_flow.dart';
import 'package:flutter_template/features/app/di/app_scope_register.dart';

/// App launch.
Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  final fbOptions = Environment.instance().firebaseOptions;

  if (fbOptions != null) {
    await Firebase.initializeApp(options: fbOptions);
  }

  // TODO(init-project): change as needed or remove.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // TODO(init-project): Initialize Crashlytics.
  // _setupCrashlytics();

  await _runApp();
}

Future<void> _runApp() async {
  const scopeRegister = AppScopeRegister();
  final scope = await scopeRegister.createScope();
  await scope.init();

  runApp(AppFlow(appScope: scope));
}

void _setupCrashlytics() {
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
