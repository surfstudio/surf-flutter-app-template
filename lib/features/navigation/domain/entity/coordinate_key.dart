import 'package:flutter/material.dart';

/// Key for the screen
/// Stores coordinate parameters
class CoordinateKey extends LocalKey {
  final Object? arguments;
  final String? path;

  const CoordinateKey({
    required this.arguments,
    required this.path,
  });
}
