import 'package:flutter_template/features/app/domain/coordinate.dart';
import 'package:flutter_template/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/temp/screens/init_screen.dart';

/// A set of routes for the entire app.
class AppCoordinate implements Coordinate {
  /// Initialization screens([InitScreen]).
  static const initScreen = AppCoordinate._('temp');

  /// Debug screens([DebugScreen]).
  static const debugScreen = AppCoordinate._('debug_screen');

  /// Initialization screens(it can be any screens).
  static const initial = initScreen;

  final String _value;

  const AppCoordinate._(this._value);

  @override
  String toString() => _value;
}

/// List of main routes of the app.
final Map<AppCoordinate, CoordinateBuilder> appCoordinates = {
  AppCoordinate.initial: (_, __) => const InitScreen(),
  AppCoordinate.debugScreen: (_, __) => const DebugScreen(),
};
