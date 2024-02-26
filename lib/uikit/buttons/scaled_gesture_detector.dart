import 'package:flutter/material.dart';
import 'package:flutter_template/common/widgets/conditional_wrapper.dart';
import 'package:flutter_template/uikit/buttons/animated_press_scale.dart';

/// {@template scaled_gesture_detector.class}
/// GestureDetector with click animation.
/// {@endtemplate}
class ScaledGestureDetector extends StatefulWidget {
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

  /// The callback of pressing the button.
  final VoidCallback? onTap;

  /// @nodoc.
  final VoidCallback? onTapUp;

  /// @nodoc.
  final VoidCallback? onTapDown;

  /// @nodoc.
  final VoidCallback? onTapCancel;

  /// The element that will shrink when clicked.
  final Widget child;

  /// How to behave during hit tests.
  final HitTestBehavior? behavior;

  @override
  State<ScaledGestureDetector> createState() => _ScaledGestureDetectorState();
}

class _ScaledGestureDetectorState extends State<ScaledGestureDetector> {
  late bool _isPressed;

  @override
  void initState() {
    super.initState();

    _isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: widget.onTap != null,
      onAddWrapper: (child) => GestureDetector(
        onTapDown: (_) {
          setState(() => _isPressed = true);
          widget.onTapDown?.call();
        },
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTapUp?.call();
        },
        onTap: widget.onTap,
        onTapCancel: () {
          setState(() => _isPressed = false);
          widget.onTapCancel?.call();
        },
        behavior: widget.behavior ?? HitTestBehavior.opaque,
        child: AnimatedPressScale(
          isPressed: _isPressed,
          key: widget.key,
          child: widget.child,
        ),
      ),
      child: widget.child,
    );
  }
}
