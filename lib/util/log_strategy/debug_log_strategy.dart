import 'package:logger/logger.dart';
import 'package:surf_logger/surf_logger.dart' as surf;

/// {@template debug_log_strategy.class}
/// Strategy for log output to console.
/// * used for local debugging
/// {@endtemplate}
class DebugLogStrategy extends surf.LogStrategy {
  final Logger _logger;

  /// {@macro debug_log_strategy.class}
  DebugLogStrategy([Logger? logger]) : _logger = logger ??= Logger(printer: PrettyPrinter(methodCount: 0));

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
