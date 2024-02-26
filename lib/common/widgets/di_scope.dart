import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:provider/provider.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function();

/// Di container. T - return type(for example [AppScope]).
class DiScope<T> extends StatefulWidget {
  /// Create an instance [DiScope].
  const DiScope({
    required this.onFactory,
    required this.child,
    this.onDispose,
    super.key,
  });

  /// Factory that returns the dependency scope.
  final ScopeFactory<T> onFactory;

  /// The widget below this widget in the tree.
  final Widget child;

  /// The method called when disposing the widget.
  final ValueChanged<T>? onDispose;

  @override
  State<DiScope<T>> createState() => _DiScopeState<T>();
}

class _DiScopeState<T> extends State<DiScope<T>> {
  late T _scope;

  @override
  void initState() {
    super.initState();
    _scope = widget.onFactory();
  }

  @override
  void dispose() {
    widget.onDispose?.call(_scope);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      create: (_) => _scope,
      child: widget.child,
    );
  }
}
