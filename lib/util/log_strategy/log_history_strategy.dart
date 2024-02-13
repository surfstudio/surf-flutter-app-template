import 'dart:io';

import 'package:flutter_template/util/log_strategy/debug_log_strategy.dart';
import 'package:logger/logger.dart';

/// {@template log_history_strategy.class}
/// Strategy for log output to file.
/// * used for local debugging with qa environment.
/// {@endtemplate}
class LogHistoryStrategy extends DebugLogStrategy {
  /// {@macro log_history_strategy.class}
  LogHistoryStrategy(super.logger);
}

/// Writes the log output to a file.
class FileCustomOutput extends LogOutput {
  /// File for write log history.
  final File file;
  IOSink? _sink;

  /// Create an instance [FileCustomOutput].
  FileCustomOutput({required this.file});

  @override
  void init() {
    _sink = file.openWrite(
      mode: FileMode.writeOnlyAppend,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink?.writeln('/// Start \n TimeStamp ${DateTime.now()}');
    _sink?.writeln('${event.level}\n');
    for (final line in event.lines) {
      _sink?.writeln(line);
      _sink?.writeln();
    }
    _sink?.writeln();
    _sink?.writeln('/// End \n');
  }

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}
