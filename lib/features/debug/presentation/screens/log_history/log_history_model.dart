import 'package:elementary/elementary.dart';
import 'package:flutter_template/common/service/log_history/log_history_service.dart';
import 'package:flutter_template/features/debug/presentation/screens/log_history/log_history_screen.dart';

/// Model for [LogHistoryScreen].
class LogHistoryModel extends ElementaryModel {
  /// Remove all content from logs history file.
  Future<void> clearLogHistory() async {
    await const LogHistoryService().clearLogHistory();
  }

  /// Upload logs history file.
  Future<String> loadFile() {
    return const LogHistoryService().loadFile();
  }
}
