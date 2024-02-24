import 'dart:async';
import 'dart:io';

import 'package:flutter_template/common/service/log_history/i_log_history_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// A service that work with log history.
class LogHistoryService implements ILogHistoryService {
  static const _fileName = 'debug-log.txt';

  /// Create an instance [LogHistoryService].
  const LogHistoryService();

  @override
  Future<void> clearLogHistory() async {
    final file = await logHistoryFile();

    unawaited(file.writeAsString(''));
  }

  @override
  Future<String> loadFile() async {
    final file = await logHistoryFile();

    final contents = await file.readAsString();

    return contents.replaceAll('\u0000', '');
  }

  @override
  Future<File> logHistoryFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final fullPath = join(directory.path, _fileName);

    return File(fullPath);
  }
}
