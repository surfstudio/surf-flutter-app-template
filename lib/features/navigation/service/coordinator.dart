import 'package:flutter/material.dart';
import 'package:flutter_template/features/navigation/domain/entity/coordinate.dart';
import 'package:flutter_template/features/navigation/domain/entity/coordinate_key.dart';
import 'package:flutter_template/features/navigation/domain/entity/coordinate_route.dart';
import 'package:flutter_template/features/navigation/domain/entity/coordinator_exceptions.dart';
import 'package:flutter_template/features/temp/screens/temp_screen/temp_screen.dart';

/// Class that coordinates navigation for the whole app and provides
/// methods for navigation.
class Coordinator extends ChangeNotifier {
  final _coordinates = <Coordinate, CoordinateRoute>{};

  final _pages = [
    const MaterialPage<void>(
      key: ValueKey('/init'),
      name: '/init',
      child: TempScreen(),
    ),
  ];

  /// Initial screens coordinates.
  Coordinate? initialCoordinate;

  /// Coordinate list.
  Map<Coordinate, CoordinateRoute> get coordinates => _coordinates;

  /// [Page]s list.
  List<Page> get pages => List.of(_pages);

  /// Initial screens route.
  String? get initialRoute => _coordinates[initialCoordinate]?.path;

  /// Method for registering new coordinate.
  void registerCoordinates(
    String name,
    Map<Coordinate, CoordinateBuilder> coordinates,
  ) {
    _coordinates.addEntries(
      coordinates.entries.map(
        (entry) => MapEntry(
          entry.key,
          CoordinateRoute(
            path: '$name${entry.key}',
            builder: entry.value,
            isUnique: entry.key.isUnique,
          ),
        ),
      ),
    );
  }

  /// Main method for navigation.
  void navigate(
    BuildContext context,
    Coordinate target, {
    Object? arguments,
    bool replaceCurrentCoordinate = false,
    bool replaceRootCoordinate = false,
  }) {
    final coordinateRoute = _getCoordinateRoute(target);

    if (replaceRootCoordinate) {
      _pages.clear();
    } else if (replaceCurrentCoordinate) {
      _pages.removeLast();
    }

    _pages.add(
      _buildMaterialPage(
        context,
        coordinateRoute: coordinateRoute,
        arguments: arguments,
      ),
    );

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  /// Method for removing the topmost route.
  void pop() {
    assert(_pages.isNotEmpty);

    _pages.removeLast();

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  /// Method for deleting all routes except the first.
  void popUntilRoot() {
    assert(_pages.isNotEmpty);

    _pages.removeRange(1, _pages.length);

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  /// Method for deleting all routes except the first and inserting a new
  /// route in their place.
  void replaceUntilRoot(
    BuildContext context,
    Coordinate target, {
    Object? arguments,
  }) {
    assert(_pages.isNotEmpty);
    final coordinateRoute = _getCoordinateRoute(target);

    _pages
      ..removeRange(1, _pages.length)
      ..add(
        _buildMaterialPage(
          context,
          coordinateRoute: coordinateRoute,
          arguments: arguments,
        ),
      );

    debugPrint(_pages.map((e) => e.name).toList().toString());

    notifyListeners();
  }

  MaterialPage<void> _buildMaterialPage(
    BuildContext context, {
    required CoordinateRoute coordinateRoute,
    Object? arguments,
  }) {
    return MaterialPage<void>(
      key: coordinateRoute.isUnique
          ? ValueKey(coordinateRoute.path)
          : CoordinateKey(
              arguments: arguments,
              path: coordinateRoute.path,
            ),
      name: coordinateRoute.path,
      child: coordinateRoute.builder(context, arguments),
      arguments: arguments,
    );
  }

  /// By coordinate, get data from the registered coordinates to build a Page
  CoordinateRoute _getCoordinateRoute(Coordinate target) {
    final isRegistered = _coordinates.containsKey(target);

    if (isRegistered == false) {
      throw CoordinatorExceptions(
        'CoordinatorExceptions: The coordinate ${target.value} is not registered!',
      );
    }

    return _coordinates[target]!;
  }
}
