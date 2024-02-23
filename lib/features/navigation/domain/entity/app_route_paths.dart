/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  /// Path to temp screen.
  static const tempPath = '/temp';

  /// Path to debug screen.
  static const debugPath = 'debug';

  /// Path to ui kit screen.
  static const uiKitPath = '/ui_kit';

  /// Path to dash screen.
  static const dashPath = 'dash';

  /// Path to info screen.
  static const infoPath = 'info';

  /// Path to logs history screen.
  static const logHistory = '/logHistory';
}
