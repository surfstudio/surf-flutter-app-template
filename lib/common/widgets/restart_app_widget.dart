import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Trigger to restart the widget.
typedef AppRestarter = void Function();

/// {@template restart_app_widget.class}
/// Widget that completely restarts its subtree when [AppRestarter] is called.
/// {@endtemplate}
class RestartAppWidget extends StatefulWidget {
  /// Child
  final Widget child;

  /// {@macro restart_app_widget.class}
  const RestartAppWidget({
    required this.child,
    super.key,
  });

  @override
  State<RestartAppWidget> createState() => _RestartAppWidgetState();
}

class _RestartAppWidgetState extends State<RestartAppWidget> {
  var _key = UniqueKey();

  void _restart() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AppRestarter>.value(
      key: _key,
      value: _restart,
      child: widget.child,
    );
  }
}
