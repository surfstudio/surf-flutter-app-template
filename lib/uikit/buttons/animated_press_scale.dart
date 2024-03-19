import 'package:flutter/material.dart';

const _defaultDuration = Duration(milliseconds: 200);

const _defaultPressedScale = 0.98;

/// {@template animated_press_scale.class}
/// Implicit animation. Wrapper over [AnimatedScale].
///
/// A single click animation for all buttons in the application. When the button
/// is pressed, it decreases by the size `scale` fixed in the constant `duration'.
/// {@endtemplate}
class AnimatedPressScale extends StatelessWidget {
  /// {@macro animated_press_scale.class}
  const AnimatedPressScale({
    required this.isPressed,
    required this.child,
    super.key,
  });

  /// Something that will be animated.
  final Widget child;

  /// Whether the button is currently being pressed.
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      // When clicked, it reduces the content from the animation.
      scale: isPressed ? _defaultPressedScale : 1.0,
      duration: _defaultDuration,
      child: child,
    );
  }
}
