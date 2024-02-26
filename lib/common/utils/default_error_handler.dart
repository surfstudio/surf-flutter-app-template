import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

/// {@template default_error_handler.class}
/// Base implementation of error handler.
/// This just print error to console.
/// {@endtemplate}
class DefaultErrorHandler implements ErrorHandler {
  /// {@macro default_error_handler.class}
  const DefaultErrorHandler();

  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    if (!kDebugMode) return;
    if (kDebugMode) {
      print(error);
      print(stackTrace);
    }
  }
}
