import 'package:elementary/elementary.dart';

/// Base implementation of error handler.
/// This just print error to console.
class DefaultErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error) {
    // ignore: avoid_print
    print(error);
  }
}
