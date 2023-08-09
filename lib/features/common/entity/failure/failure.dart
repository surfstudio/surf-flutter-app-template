/// An error handled in the application's business logic layer.
///
/// This is expected to be the only type of error that we can encounter
/// in the application's presentation layer.
class Failure implements Exception {
  /// Error message.
  ///
  /// It should contain content that will be understandable when reading logs
  /// or, in extreme cases, when displayed to the user.
  final String? message;

  /// Parent [Exception], if any.
  ///
  /// Necessary for proper log capturing.
  final Exception? parentException;

  /// [StackTrace] of the parent error, if any.
  final StackTrace? stackTrace;

  /// Extended error message.
  ///
  /// Not intended for user's eyes. To be used for logging or debugging.
  final String? debugMessage;

  /// Creates an instance of [Failure].
  const Failure({
    this.message,
    this.parentException,
    this.stackTrace,
    this.debugMessage,
  });

  @override
  String toString() =>
      'Failure(message: "$message", debugMessage: "$debugMessage", parentException: $parentException)';
}
