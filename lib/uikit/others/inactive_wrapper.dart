import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/app_sizes.dart';

/// {@template inactive_wrapper.class}
/// A wrapper for displaying inactive elements.
/// {@endtemplate}
class InactiveWrapper extends StatelessWidget {
  /// {@macro inactive_wrapper.class}
  const InactiveWrapper({required this.child, required this.inactive, super.key});

  /// @nodoc.
  final Widget child;

  /// Whether the widget is inactive.
  final bool inactive;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: inactive,
      child: Opacity(
        opacity: inactive ? AppSizes.double05 : AppSizes.double1,
        child: child,
      ),
    );
  }
}
