import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/alerts/app_alert.dart';

/// {@template app_alert_action.class}
/// Dialog action widget [AppAlert]
///
/// It is a wrapper over [TextButton] for Android and [CupertinoButton] for iOS.
/// {@endtemplate}
class AppAlertAction extends StatelessWidget {
  /// Action widget.
  ///
  /// Usually [Text].
  final Widget child;

  /// A function that is called when an action is clicked.
  final VoidCallback onPressed;

  /// Only for iOS.
  final bool isDefaultAction;

  /// Only for iOS.
  final bool isDestructiveAction;

  /// Oonly for Android.
  final ButtonStyle? style;

  /// {@macro app_alert_action.class}
  const AppAlertAction({
    required this.child,
    required this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        child: child,
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
      );
    } else {
      return TextButton(
        child: child,
        onPressed: onPressed,
        style: style,
      );
    }
  }
}
