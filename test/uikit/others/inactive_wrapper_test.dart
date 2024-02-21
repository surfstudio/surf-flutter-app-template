import 'package:flutter/material.dart';

import 'package:flutter_template/uikit/others/inactive_wrapper.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens(
    'Golden Inactive wrapper',
    (tester) async {
      final builder = GoldenBuilder.column(
        bgColor: Colors.white,
      )
        ..addScenario(
          'Inactive black square',
          InactiveWrapper(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.black,
            ),
            inactive: true,
          ),
        )
        ..addScenario(
          'Active black square',
          InactiveWrapper(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.black,
            ),
            inactive: false,
          ),
        );

      await tester.pumpWidgetBuilder(builder.build(), surfaceSize: const Size(200, 350));

      await screenMatchesGolden(tester, 'incative_wrapper');
    },
  );
}
