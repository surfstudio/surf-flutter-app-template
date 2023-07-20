import 'dart:async';

import 'package:mocktail/mocktail.dart';

/// Mock of VoidCallback.
class VoidCallbackMock extends Mock {
  void call();
}

/// Mock of Future<void> Function().
class AsyncVoidCallbackMock extends Mock {
  Future<void> call();
}

/// Mock of ValueChanged<T>.
class ValueChangedMock<T> extends Mock {
  void call(T value);
}

/// Mock of FutureOr<R> Function(A).
class FutureOrCallback<R, A> extends Mock {
  FutureOr<R> call(A value);
}
