import 'package:flutter/material.dart';

const Duration _defaultDuration = Duration(milliseconds: 200);

const double _defaultOnPressScale = 0.98;

/// {@template animated_press_scale.class}
/// Implicit animation. Wrapper over [AnimatedScale].
///
/// A single click animation for all buttons in the application. When the button
/// is pressed, it decreases by the size `scale` fixed in the constant `duration'.
/// {@endtemplate}
class AnimatedPressScale extends StatelessWidget {
  /// Something that will be animated.
  final Widget child;

  /// Whether the button is currently being pressed.
  final bool isOnPress;

  /// {@macro animated_press_scale.class}
  const AnimatedPressScale({
    required this.isOnPress,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      // When clicked, it reduces the content from the animation.
      scale: isOnPress ? _defaultOnPressScale : 1,
      duration: _defaultDuration,
      child: child,
    );
  }
}
