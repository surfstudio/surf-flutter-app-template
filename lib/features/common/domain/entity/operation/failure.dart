/// {@template failure.class}
/// Failure
/// {@endtemplate}
base class Failure<T extends Object?> implements Exception {
  /// Original error
  final T original;

  /// Stack Trace
  final StackTrace trace;

  /// {@macro failure.class}
  const Failure({
    required this.original,
    required this.trace,
  });
}
