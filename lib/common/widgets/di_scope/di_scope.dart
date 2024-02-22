import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:provider/provider.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function();

/// Di container. T - return type(for example [AppScope]).
class DiScope<T> extends StatefulWidget {
  /// Factory that returns the dependency scope.
  final ScopeFactory<T> factory;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The method called when disposing the widget.
  final Function(T)? dispose;

  /// Create an instance [DiScope].
  const DiScope({
    required this.factory,
    required this.child,
    this.dispose,
    super.key,
  });

  @override
  State<DiScope<T>> createState() => _DiScopeState<T>();
}

class _DiScopeState<T> extends State<DiScope<T>> {
  late T scope;

  @override
  void initState() {
    super.initState();
    scope = widget.factory();
  }

  @override
  void dispose() {
    widget.dispose?.call(scope);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      create: (_) => scope,
      child: widget.child,
    );
  }
}
