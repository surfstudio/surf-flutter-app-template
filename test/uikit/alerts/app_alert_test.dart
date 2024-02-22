import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/alerts/app_alert.dart';
import 'package:flutter_template/uikit/alerts/app_alert_action.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  final actions = [
    AppAlertAction(
      child: const Text('Cancel'),
      onPressed: () {},
    ),
    AppAlertAction(
      child: const Text('Ok'),
      onPressed: () {},
    ),
  ];

  testGoldens(
    'Golden App alert',
    (tester) async {
      final builder = GoldenBuilder.column(
        bgColor: Colors.white,
      )
        ..addScenario(
          'With title, content and actions',
          AppAlert(
            title: const Text('App alert'),
            content: const Text('App alert content'),
            actions: actions,
          ),
        )
        ..addScenario(
          'Without title',
          AppAlert(
            content: const Text('App alert content'),
            actions: actions,
          ),
        )
        ..addScenario(
          'Without content',
          AppAlert(
            title: const Text('App alert'),
            actions: actions,
          ),
        )
        ..addScenario(
          'Without actions',
          const AppAlert(
            title: Text('App alert'),
            content: Text('App alert content'),
            actions: [],
          ),
        );

      await tester.pumpWidgetBuilder(builder.build(), surfaceSize: const Size(400, 1000));

      await screenMatchesGolden(tester, 'app_alert');
    },
  );
}
