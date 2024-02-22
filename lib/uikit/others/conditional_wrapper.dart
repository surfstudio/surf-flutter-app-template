import 'package:flutter/material.dart';

/// {@template conditional_wrapper.class}
/// Wrap the child with a wrapper if the condition is true.
/// {@endtemplate}
class ConditionalWrapper extends StatelessWidget {
  /// Condition to wrap the child.
  final bool condition;

  /// Wrapper for the child.
  final Widget Function(Widget child) wrapper;

  /// Child to be wrapped.
  final Widget child;

  /// {@macro conditional_wrapper.class}
  const ConditionalWrapper(
      {required this.condition, required this.wrapper, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return condition ? wrapper(child) : child;
  }
}
