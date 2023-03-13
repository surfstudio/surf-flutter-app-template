import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/debug_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
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

  _initLogger();
  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async {
      final scope = AppScope();
      await scope.initTheme();
      runApp(ValueListenableBuilder<DevicePreviewSettings>(
        valueListenable:
            Environment<AppConfig>.instance().config.debugOptions.devicePreviewSettings,
        builder: (_, snapshot, __) {
          return DevicePreview(
            enabled: !kReleaseMode && snapshot.isDevicePreviewEnabled,
            isToolbarVisible: snapshot.isDevicePreviewToolbarVisible,
            builder: (_) => App(scope),
          );
        },
      ));
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
