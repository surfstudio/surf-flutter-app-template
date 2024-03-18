import 'package:flutter/material.dart';

import 'package:flutter_template/uikit/others/inactive_wrapper.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

const _double100 = 100.0;
const _double200 = 200.0;
const _double350 = 350.0;

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
            inactive: true,
            child: Container(
              color: Colors.black,
              width: _double100,
              height: _double100,
            ),
          ),
        )
        ..addScenario(
          'Active black square',
          InactiveWrapper(
            inactive: false,
            child: Container(
              color: Colors.black,
              width: _double100,
              height: _double100,
            ),
          ),
        );

      await tester.pumpWidgetBuilder(builder.build(), surfaceSize: const Size(_double200, _double350));

      await screenMatchesGolden(tester, 'incative_wrapper');
    },
  );
}
