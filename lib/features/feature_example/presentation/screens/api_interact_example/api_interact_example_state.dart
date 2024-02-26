/// The state of the api interaction example screen.
sealed class ApiInteractExampleState {}

/// Initial state.
class ApiInteractExampleStateInitial extends ApiInteractExampleState {}

/// Loading a ip address.
class ApiInteractExampleStateLoading extends ApiInteractExampleState {}

/// {@template loaded.class}
/// Ip adress is loaded.
/// {@endtemplate}
class ApiInteractExampleStateLoaded extends ApiInteractExampleState {
  /// Ip address.
  final String ip;

  /// {@macro loaded.class}
  ApiInteractExampleStateLoaded(this.ip);
}

/// Error loading a ip address.
class ApiInteractExampleStateError extends ApiInteractExampleState {}
