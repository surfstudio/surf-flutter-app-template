import 'package:flutter/widgets.dart';

/// Factory for building coordinates.
typedef CoordinateBuilder = Widget Function(BuildContext context, Object? data);

/// Basic coordinate representation.
abstract class Coordinate {
  final String value;
  final bool isUnique;

  const Coordinate({
    required this.value,
    required this.isUnique,
  });

  @override
  String toString() => value;
}
