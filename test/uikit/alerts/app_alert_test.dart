import 'package:flutter/material.dart';
import 'package:flutter_template/uikit/alerts/app_alert.dart';
import 'package:flutter_template/uikit/alerts/app_alert_action.dart';
import 'package:flutter_template/uikit/app_sizes.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  final actions = [
    AppAlertAction(
      onPressed: () {
        debugPrint('AppAlertAction Cancel');
      },
      child: const Text('Cancel'),
    ),
    AppAlertAction(
      onPressed: () {
        debugPrint('AppAlertAction Ok');
      },
      child: const Text('Ok'),
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
            actions: actions,
            title: const Text('App alert'),
            content: const Text('App alert content'),
          ),
        )
        ..addScenario(
          'Without title',
          AppAlert(
            actions: actions,
            content: const Text('App alert content'),
          ),
        )
        ..addScenario(
          'Without content',
          AppAlert(
            actions: actions,
            title: const Text('App alert'),
          ),
        )
        ..addScenario(
          'Without actions',
          const AppAlert(
            actions: [],
            title: Text('App alert'),
            content: Text('App alert content'),
          ),
        );

      await tester.pumpWidgetBuilder(builder.build(), surfaceSize: const Size(AppSizes.double400, AppSizes.double1000));

      await screenMatchesGolden(tester, 'app_alert');
    },
  );
}
