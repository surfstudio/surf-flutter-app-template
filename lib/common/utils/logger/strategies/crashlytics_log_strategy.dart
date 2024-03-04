import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:surf_logger/surf_logger.dart';

/// {@template crashlytics_log_strategy.class}
/// surf_logger strategy for sending logs to Crashlytics.
/// {@endtemplate}
class CrashlyticsLogStrategy extends LogStrategy {
  final FirebaseCrashlytics _crashlytics;

  /// {@macro crashlytics_log_strategy.class}
  CrashlyticsLogStrategy(this._crashlytics);

  @override
  void log(Object message) {
    _crashlytics.log(message.toString());
  }

  @override
  void e(Object exception, [StackTrace? stackTrace]) {
    _crashlytics.recordError(
      exception,
      stackTrace,
    );
  }

  @override
  void w(String message, [Exception? exception, StackTrace? stackTrace]) {
    _crashlytics.log(message);
  }
}
