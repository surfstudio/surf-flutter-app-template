// ignore_for_file: prefer-match-file-name

/// Let extension
extension LetX<T extends Object> on T {
  /// Executes a closure, where the argument is the value itself
  R let<R>(R Function(T it) closure) {
    return closure(this);
  }

  /// Executes a closure, where the argument is the value itself
  R? run<R>(R? Function(T it) closure) {
    return closure(this);
  }
}

/// Let nullable extension
extension LetNullableX<T extends Object> on T? {
  /// Executes a closure on a nullable value, where the argument is the value itself
  R? let<R>(R Function(T it) closure) {
    return this != null ? closure(this!) : null;
  }

  /// Executes a closure on a nullable value, where the argument is the value itself
  R? run<R>(R? Function(T it) closure) {
    return this != null ? closure(this!) : null;
  }
}

/// Also extension
extension AlsoX<T extends Object?> on T {
  /// Additionally executes a closure and returns the value itself
  T also(void Function(T it) closure) {
    closure(this);
    return this;
  }
}

/// Repeat extension
extension RepeatX<T extends Object?> on T {
  /// Returns a Iterable<T> containing this object repeated [times] times.
  Iterable<T> repeat(int times) {
    return Iterable.generate(times, (_) => this);
  }
}
