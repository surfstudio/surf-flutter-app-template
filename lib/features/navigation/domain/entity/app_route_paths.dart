/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  /// Path to debug screen.
  static const String debugPath = '/debug';

  /// Path to ui kit screen.
  static const String uiKitPath = '/ui_kit';

  /// Path to feature example screen.
  static const String featureExample = '/feature_example';
}
