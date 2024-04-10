// ignore_for_file: prefer-match-file-name

/// The closure that is passed as a parameter to extension methods.
typedef Closure<R, T> = R Function(T it);

/// Let extension.
extension LetX<T extends Object> on T {
  /// Executes a closure, where the argument is the value itself.
  R let<R>(Closure<R, T> closure) {
    return closure(this);
  }

  /// Executes a closure, where the argument is the value itself.
  R? run<R>(Closure<R?, T> closure) {
    return closure(this);
  }
}

/// Let nullable extension.
extension LetNullableX<T extends Object> on T? {
  /// Executes a closure on a nullable value, where the argument is the value itself.
  R? let<R>(Closure<R, T> closure) {
    final object = this;

    return object == null ? null : closure(object);
  }

  /// Executes a closure on a nullable value, where the argument is the value itself.
  R? run<R>(Closure<R?, T> closure) {
    final object = this;

    return object == null ? null : closure(object);
  }
}

/// Also extension.
extension AlsoX<T extends Object?> on T {
  /// Additionally executes a closure and returns the value itself.
  T also(Closure<void, T> closure) {
    closure(this);

    return this;
  }
}

/// Repeat extension.
extension RepeatX<T extends Object?> on T {
  /// Returns a Iterable<T> containing this object repeated [times] times.
  Iterable<T> repeat(int times) {
    return Iterable.generate(times, (_) => this);
  }
}
