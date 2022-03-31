class CoordinatorExceptions implements Exception {
  final String message;

  CoordinatorExceptions(this.message);

  @override
  String toString() => 'CoordinatorExceptions(message: $message)';
}
