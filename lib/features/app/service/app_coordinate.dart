import 'package:flutter_template/features/app/domain/coordinate.dart';
import 'package:flutter_template/features/debug/di/debug_screen_scope.dart';
import 'package:flutter_template/features/debug/screen/debug_screen/debug_screen.dart';
import 'package:flutter_template/features/temp/screen/init_screen.dart';
import 'package:flutter_template/util/di_scope.dart';

/// A set of routes for the entire app.
class AppCoordinate implements Coordinate {
  /// Initialization screen([InitScreen]).
  static const initScreen = AppCoordinate._('temp');
  /// Debug screen([DebugScreen]).
  static const debugScreen = AppCoordinate._('debug_screen');

  /// Initialization screen(it can be any screen).
  static const initial = initScreen;

  final String _value;

  const AppCoordinate._(this._value);

  @override
  String toString() => _value;
}

/// List of main routes of the app.
final Map<AppCoordinate, CoordinateBuilder> appCoordinates = {
  AppCoordinate.initScreen: (_, __) => const InitScreen(),
  AppCoordinate.debugScreen: (_, __) => const DiScope<IDebugScreen>(
        factory: debugScreenFactory,
        child: DebugScreen(),
      ),
};
