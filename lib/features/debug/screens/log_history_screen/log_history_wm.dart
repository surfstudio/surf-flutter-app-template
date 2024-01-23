import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/debug/screens/log_history_screen/log_history_model.dart';
import 'package:flutter_template/features/debug/screens/log_history_screen/log_history_screen.dart';

/// Interface of [LogHistoryWm].
abstract class ILogHistoryWm extends IWidgetModel {
  /// Listener current state for log history.
  ValueListenable<String> get logHistory;

  /// Remove all content from logs history file.
  void clearLogHistory();
}

/// Widget model for [LogHistoryScreen].
class LogHistoryWm extends WidgetModel<LogHistoryScreen, LogHistoryModel> implements ILogHistoryWm {
  final _logsHistory = ValueNotifier('');

  @override
  ValueListenable<String> get logHistory => _logsHistory;

  /// Create an instance [LogHistoryWm].
  LogHistoryWm(super._model) {
    _loadFile();
  }

  @override
  Future<void> clearLogHistory() async {
    await model.clearLogHistory();
    await _loadFile();
  }

  Future<void> _loadFile() async {
    final contents = await model.loadFile();

    _logsHistory.value = contents.replaceAll('\u0000', '');
  }
}

/// Factory for [LogHistoryWm].
LogHistoryWm logHistoryScreenWmFactory(
  BuildContext context,
) {
  final model = LogHistoryModel();
  return LogHistoryWm(model);
}
