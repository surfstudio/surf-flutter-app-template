import 'package:flutter_template/features/navigation/domain/entity/coordinate.dart';

/// Route for the coordinate
/// [path] - generated from the prefix and the name of the coordinate
/// when registering the coordinate
class CoordinateRoute {
  final String path;
  final CoordinateBuilder builder;
  final bool isUnique;

  const CoordinateRoute({
    required this.path,
    required this.builder,
    required this.isUnique,
  });

  @override
  String toString() {
    return path;
  }
}