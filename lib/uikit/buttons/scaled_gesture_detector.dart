import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/buttons/animated_pressed_scale.dart';
import 'package:flutter_template/uikit/others/conditional_wrapper.dart';

/// {@template scaled_gesture_detector.class}
/// GestureDetector with click animation.
/// {@endtemplate}
class ScaledGestureDetector extends StatefulWidget {
  /// The callback of pressing the button.
  final VoidCallback? onTap;

  /// @nodoc
  final VoidCallback? onTapUp;

  /// @nodoc
  final VoidCallback? onTapDown;

  /// @nodoc
  final VoidCallback? onTapCancel;

  /// The element that will shrink when clicked.
  final Widget child;

  /// How to behave during hit tests.
  final HitTestBehavior? behavior;

  /// {@macro scaled_gesture_detector.class}
  const ScaledGestureDetector({
    required this.child,
    this.onTap,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
    this.behavior,
    super.key,
  });

  @override
  State<ScaledGestureDetector> createState() => _ScaledGestureDetectorState();
}

class _ScaledGestureDetectorState extends State<ScaledGestureDetector> {
  late bool isPressed;

  @override
  void initState() {
    super.initState();

    isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: widget.onTap != null,
      wrapper: (child) => GestureDetector(
        onTap: widget.onTap,
        onTapUp: (_) {
          setState(() => isPressed = false);
          widget.onTapUp?.call();
        },
        onTapDown: (_) {
          setState(() => isPressed = true);
          widget.onTapDown?.call();
        },
        onTapCancel: () {
          setState(() => isPressed = false);
          widget.onTapCancel?.call();
        },
        behavior: widget.behavior ?? HitTestBehavior.opaque,
        child: AnimatedPressScale(
          key: widget.key,
          child: widget.child,
          isPressed: isPressed,
        ),
      ),
      child: widget.child,
    );
  }
}
