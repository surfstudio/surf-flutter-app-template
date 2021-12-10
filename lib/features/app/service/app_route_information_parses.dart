import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/service/app_coordinate.dart';
import 'package:flutter_template/features/app/domain/coordinate.dart';

/// [RouteInformationParser] implementation.
/// Passed in the routeInformationParser field in [MaterialApp.router].
class AppRouteInformationParser extends RouteInformationParser<Coordinate> {
  @override
  Future<Coordinate> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(AppCoordinate.initScreen);
}
