// ignore_for_file: prefer_mixin

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/navigation/domain/entity/coordinate.dart';
import 'package:flutter_template/features/navigation/service/coordinator.dart';

/// [RouterDelegate] implementation.
/// Passed in the routerDelegate field in [MaterialApp.router].
class AppRouterDelegate extends RouterDelegate<Coordinate>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Coordinate> {
  /// Class that coordinates navigation for the whole app.
  final Coordinator coordinator;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  /// Create an instance [AppRouterDelegate].
  AppRouterDelegate(this.coordinator)
      : navigatorKey = GlobalKey<NavigatorState>() {
    coordinator.addListener(notifyListeners);
  }

  @override
  void dispose() {
    coordinator.removeListener(notifyListeners);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: coordinator.pages,
      // ignore: avoid_types_on_closure_parameters
      onPopPage: (route, Object? result) {
        if (!route.didPop(result)) {
          return false;
        } else {
          coordinator.pop();

          return true;
        }
      },
    );
  }

  /// Called by the Router when the Router.routeInformationProvider
  /// reports that a new route has been pushed to the application by the operating system.
  @override
  Future<void> setNewRoutePath(Coordinate configuration) async =>
      SynchronousFuture(null);
}
