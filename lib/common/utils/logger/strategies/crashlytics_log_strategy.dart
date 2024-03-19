import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:surf_logger/surf_logger.dart';

/// {@template crashlytics_log_strategy.class}
/// Surf_logger strategy for sending logs to Crashlytics.
/// {@endtemplate}
class CrashlyticsLogStrategy extends LogStrategy {
  final FirebaseCrashlytics _crashlytics;

  /// {@macro crashlytics_log_strategy.class}
  CrashlyticsLogStrategy(this._crashlytics);

  @override
  Future<void> log(Object message) async {
    await _crashlytics.log(message.toString());
  }

  @override
  Future<void> e(Object exception, [StackTrace? stackTrace]) async {
    await _crashlytics.recordError(
      exception,
      stackTrace,
    );
  }

  @override
  Future<void> w(String message, [Exception? exception, StackTrace? stackTrace]) async {
    await _crashlytics.log(message);
  }
}
