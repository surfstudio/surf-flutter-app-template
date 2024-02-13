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

  /// Callback when the click status changes.
  final ValueChanged<bool>? isOnPressChanged;

  /// {@macro scaled_gesture_detector.class}
  const ScaledGestureDetector({
    required this.child,
    this.isOnPressChanged,
    this.onTap,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
    super.key,
  });

  @override
  State<ScaledGestureDetector> createState() => _ScaledGestureDetectorState();
}

class _ScaledGestureDetectorState extends State<ScaledGestureDetector> {
  late bool isOnPress;

  @override
  void initState() {
    super.initState();

    isOnPress = false;
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: widget.onTap != null,
      wrapper: (child) => GestureDetector(
        onTap: widget.onTap,
        onTapUp: (_) {
          setState(() => isOnPress = false);
          widget.isOnPressChanged?.call(isOnPress);
          widget.onTapUp?.call();
        },
        onTapDown: (_) {
          setState(() => isOnPress = true);
          widget.isOnPressChanged?.call(isOnPress);
          widget.onTapDown?.call();
        },
        onTapCancel: () {
          setState(() => isOnPress = false);
          widget.isOnPressChanged?.call(isOnPress);
          widget.onTapCancel?.call();
        },
        behavior: HitTestBehavior.opaque,
        child: AnimatedPressScale(
          key: widget.key,
          child: widget.child,
          isOnPress: isOnPress,
        ),
      ),
      child: widget.child,
    );
  }
}
