/// The state of feature example screen.
sealed class FeatureExampleState {
  const FeatureExampleState();
}

/// {@template feature_example_state_initial.class}
/// Initial state.
/// {@endtemplate}
class FeatureExampleStateInitial extends FeatureExampleState {
  /// {@macro feature_example_state_initial.class}
  const FeatureExampleStateInitial();
}

/// {@template feature_example_state_loading.class}
/// Loading a ip address.
/// {@endtemplate}
class FeatureExampleStateLoading extends FeatureExampleState {
  /// {@macro feature_example_state_loading.class}
  const FeatureExampleStateLoading();
}

/// {@template feature_example_state_loaded.class}
/// Ip adress is loaded.
/// {@endtemplate}
class FeatureExampleStateLoaded extends FeatureExampleState {
  /// Ip address.
  final String ip;

  /// {@macro feature_example_state_loaded.class}
  const FeatureExampleStateLoaded(this.ip);
}

/// {@template feature_example_state_error.class}
/// Error loading a ip address.
/// {@endtemplate}
class FeatureExampleStateError extends FeatureExampleState {
  /// {@macro feature_example_state_error.class}
  const FeatureExampleStateError();
}
