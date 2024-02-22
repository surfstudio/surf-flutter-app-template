import 'package:flutter/material.dart';

/// {@template lost_focus_wrapper.class}
/// A wrapper to reset the focus when tapping on an empty space.
/// {@endtemplate}
class LostFocusWrapper extends StatelessWidget {
  /// @nodoc
  final Widget child;

  /// {@macro lost_focus_wrapper.class}
  const LostFocusWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}
