import 'package:elementary/elementary.dart';

/// {@template default_error_handler.class}
/// Base implementation of error handler.
/// This just print error to console.
/// {@endtemplate}
class DefaultErrorHandler implements ErrorHandler {
  /// {@macro default_error_handler.class}
  const DefaultErrorHandler();

  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    // ignore: avoid_print
    print(error);
    // ignore: avoid_print
    print(stackTrace);
  }
}
