import 'package:async/async.dart';

/// Cancellable asynchronous operation.
///
// Use in cases where the result of a [Future] would introduce side effects to the application's
/// behavior, for example, when a screen is closed during the execution of a request,
/// but the result of the [Future] should open a new screen.
///
/// When [fetch] is called again, the result of the current ongoing asynchronous operation will be ignored.
///
/// When and how to use:
///
/// 1. Before handling the result
/// void func() {
///   fetch(futureFunc()).then(...).catchError(...);
/// }
/// or
/// Future<void> asyncFunc() async {
///   await fetch(futureFunc());
///   print('hello');
/// }
///
/// 2. If a function that could affect the application has asynchronous functions ahead of it,
/// you must wrap them in cancelOnDispose as well.
///
/// Incorrect usage example:
///
/// void func() => fetch(anotherFunc());
///
/// Future<void> anotherFunc() => asyncFunc().then(...).catchError(...);
///
class CancelableAsync<T> {
  /// The current ongoing asynchronous operation.
  Future<T>? get cachedFuture => _op?.value;

  CancelableOperation<T>? _op;

  /// Perform an asynchronous operation.
  ///
  /// If there is a current ongoing operation, it is canceled.
  Future<T> fetch(Future<T> result) async {
    _op?.cancel().ignore();
    final op = _op = CancelableOperation<T>.fromFuture(result);
    return op.value;
  }

  /// Cancel the execution of the current operation.
  void cancel() {
    _op?.cancel();
  }
}
