import 'package:flutter/material.dart';

/// Extension for [ValueNotifier].
extension ValueNotifierX<T> on ValueNotifier<T> {
  /// Change value.
  // ignore: use_setters_to_change_properties
  void emit(T value) {
    this.value = value;
  }
}
