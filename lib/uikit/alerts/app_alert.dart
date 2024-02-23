import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/alerts/app_alert_action.dart';

/// {@template app_alert.class}
/// The alert widget.
///
/// Is a wrapper over [AlertDialog] for Android and [CupertinoAlertDialog] for iOS.
/// {@endtemplate}
class AppAlert extends StatelessWidget {
  /// {@macro app_alert.class}
  const AppAlert({required this.actions, this.title, this.content, super.key});

  /// List of actions.
  final List<AppAlertAction> actions;

  /// Alert title.
  final Widget? title;

  /// Alert content.
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    final actionsLocal = actions.map((action) => action.build(context)).toList();

    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actionsLocal,
      );
    }

    return AlertDialog(
      title: title,
      content: content,
      actions: actionsLocal,
    );
  }
}
