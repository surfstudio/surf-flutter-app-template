import 'package:flutter/foundation.dart';
import 'package:flutter_template/util/disposable_object/i_disposable_object.dart';

/// Object that provides a method for resetting the state before destruction.
abstract class DisposableObject implements IDisposableObject {
  /// Flag indicating that the object is marked as dropped.
  bool _disposed = false;

  /// Method for resetting the state of an object before destroying it.
  @override
  @mustCallSuper
  void dispose() {
    assert(!_disposed, 'There is no need to call this method again');
    _disposed = true;
  }
}
