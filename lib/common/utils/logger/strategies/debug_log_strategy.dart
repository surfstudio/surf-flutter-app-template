import 'package:logger/logger.dart';
import 'package:surf_logger/surf_logger.dart' hide Logger;

/// {@template debug_log_strategy.class}
/// Surf_logger strategy for log output to console.
/// Should be used only in debug mode.
/// {@endtemplate}
class DebugLogStrategy extends LogStrategy {
  final Logger _logger;

  /// {@macro debug_log_strategy.class}
  DebugLogStrategy(this._logger);

  @override
  void e(Object exception, [StackTrace? stackTrace]) {
    _logger.e(exception.toString(), exception, stackTrace);
  }

  @override
  void log(Object message) {
    _logger.d(message);
  }

  @override
  void w(String message, [Exception? exception, StackTrace? stackTrace]) {
    _logger.w(message, exception, stackTrace);
  }
}
