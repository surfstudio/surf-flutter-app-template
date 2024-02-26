import 'package:flutter/material.dart';

/// Wrapper builder.
typedef WrapperBuilder = Widget Function(Widget child);

/// {@template conditional_wrapper.class}
/// Wrap the child with a wrapper if the condition is true.
/// {@endtemplate}
class ConditionalWrapper extends StatelessWidget {
  /// {@macro conditional_wrapper.class}
  const ConditionalWrapper({
    required this.condition,
    required this.onAddWrapper,
    required this.child,
    super.key,
  });

  /// Condition to wrap the child.
  final bool condition;

  /// Wrapper for the child.
  final WrapperBuilder onAddWrapper;

  /// Child to be wrapped.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return condition ? onAddWrapper(child) : child;
  }
}
