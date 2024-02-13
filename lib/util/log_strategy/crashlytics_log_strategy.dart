import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_logger/surf_logger.dart';

/// Strategy for sending logs to Crashlytics.
class CrashlyticsLogStrategy extends LogStrategy {
  FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;

  /// Add user info.
  void setUser(String id, String username, String email) {
    _crashlytics.setUserIdentifier(id);
  }

  /// Delete user info.
  void clearUser() {
    _crashlytics.setUserIdentifier('');
  }

  /// Log info.
  void logInfo(String key, Object? info) {
    if (info != null) {
      if (info is num || info is String || info is bool) {
        _crashlytics.setCustomKey(key, info);
        return;
      } else {
        _crashlytics.setCustomKey(key, info.toString());
      }
    }
  }

  @override
  void log(Object message) {
    _crashlytics.log(message.toString());
  }

  @override
  void e(Object exception, [StackTrace? stackTrace]) {
    _crashlytics.recordError(
      exception,
      FlutterErrorDetails(exception: exception).stack,
    );
  }

  @override
  void w(String message, [Exception? exception, StackTrace? stackTrace]) {
    _crashlytics.log(message);
  }
}
