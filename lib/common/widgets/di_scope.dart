import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function(BuildContext context);

/// Di container. T - return type(for example [AppScope]).
class DiScope<T> extends SingleChildStatefulWidget {
  /// Factory that returns the dependency scope.
  final ScopeFactory<T> factory;

  /// The method called when disposing the widget.
  final Function(T)? dispose;

  /// Create an instance [DiScope].
  const DiScope({
    required this.factory,
    this.dispose,
    super.key,
    super.child,
  });

  @override
  State<DiScope<T>> createState() => _DiScopeState<T>();
}

class _DiScopeState<T> extends SingleChildState<DiScope<T>> {
  late final T scope;

  @override
  void initState() {
    super.initState();
    scope = widget.factory(context);
  }

  @override
  void dispose() {
    widget.dispose?.call(scope);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider<T>(
      create: (_) => scope,
      child: child,
    );
  }
}
