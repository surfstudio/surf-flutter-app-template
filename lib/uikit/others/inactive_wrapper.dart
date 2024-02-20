import 'package:flutter/material.dart';

/// {@template inactive_wrapper.class}
/// A wrapper for displaying inactive elements.
/// {@endtemplate}
class InactiveWrapper extends StatelessWidget {
  /// @nodoc
  final Widget child;

  /// Whether the widget is inactive.
  final bool inactive;

  /// {@macro inactive_wrapper.class}
  const InactiveWrapper({required this.child, required this.inactive, super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: inactive,
      child: Opacity(
        opacity: inactive ? 0.5 : 1,
        child: child,
      ),
    );
  }
}
