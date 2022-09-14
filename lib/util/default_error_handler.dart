import 'package:elementary/elementary.dart';

/// Base implementation of error handler.
/// This just print error to console.
class DefaultErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    // ignore: avoid_print
    print(error);
    // ignore: avoid_print
    print(stackTrace);
  }
}
