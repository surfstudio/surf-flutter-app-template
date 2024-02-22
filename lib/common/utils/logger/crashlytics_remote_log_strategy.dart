import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_logger/surf_logger.dart';

/// Strategy for sending logs to Crashlytics.
class CrashlyticsRemoteLogStrategy extends RemoteUserLogStrategy {
  FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;

  @override
  void setUser(String id, String username, String email) {
    _crashlytics.setUserIdentifier(id).ignore();
  }

  @override
  void clearUser() {
    _crashlytics.setUserIdentifier('').ignore();
  }

  @override
  void log(String message) {
    _crashlytics.log(message).ignore();
  }

  @override
  void logError(Exception error) {
    _crashlytics
        .recordError(
          error,
          FlutterErrorDetails(exception: error).stack,
        )
        .ignore();
  }

  @override
  void logInfo(String key, Object? info) {
    if (info == null) return;

    if (info is num || info is String || info is bool) {
      _crashlytics.setCustomKey(key, info).ignore();

      return;
    }
    _crashlytics.setCustomKey(key, info.toString()).ignore();
  }
}
