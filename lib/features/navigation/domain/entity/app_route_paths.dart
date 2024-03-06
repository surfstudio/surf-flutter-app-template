/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  /// Path to debug screen.
  static const debugPath = '/debug';

  /// Path to ui kit screen.
  static const uiKitPath = '/ui_kit';

  /// Path to feature example screen.
  static const featureExample = '/feature_example';
}
