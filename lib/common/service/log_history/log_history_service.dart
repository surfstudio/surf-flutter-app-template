import 'dart:async';
import 'dart:io';

/// A service that work with log history.
abstract class LogHistoryService {
  /// Return file for write logs history.
  Future<File> logHistoryFile();

  /// Remove all content from logs history file.
  Future<void> clearLogHistory();

  /// Upload logs history file.
  Future<String> loadFile();
}
