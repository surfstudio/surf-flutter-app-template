/// List of all route names used in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Name description.
/// static const String screenName = 'screenNameRoute';
/// ```
abstract class AppRouteNames {
  /// TempScreen route name.
  static const String tempScreen = 'tempRouter';

  /// TempScreen route name.
  static const String uiKitScreen = 'uiKitRouter';

  /// DebugScreen route name.
  static const String debugScreen = 'debugRouter';

  /// DashScreen route name.
  static const String dashScreen = 'dashRouter';

  /// InfoScreen route name.
  static const String infoScreen = 'infoRouter';

  /// LogHistoryScreen route name.
  static const String logHistoryScreen = 'logHistoryRouter';
}
