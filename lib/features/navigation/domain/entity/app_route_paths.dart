/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  /// Path to temp screen.
  static const String tempPath = '/temp';

  /// Path to debug screen.
  static const String debugPath = 'debug';

  /// Path to ui kit screen.
  static const String uiKitPath = '/ui_kit';

  /// Path to dash screen.
  static const String dashPath = 'dash';

  /// Path to info screen.
  static const String infoPath = 'info';

  /// Path to logs history screen.
  static const String logHistory = '/logHistory';
}
