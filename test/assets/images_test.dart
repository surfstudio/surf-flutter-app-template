import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/assets/resources.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

const _double300 = 300.0;
const _double500 = 500.0;

void main() {
  testGoldens('Images golden test', (tester) async {
    final builder = GoldenBuilder.column(
      wrap: (content) => Align(alignment: Alignment.centerLeft, child: content),
    );

    for (final iconPath in Images.values) {
      builder.addScenario(
        iconPath,
        Image.asset(iconPath),
      );
    }

    await tester.pumpWidgetBuilder(
      builder.build(),
      wrapper: materialAppWrapper(),
      surfaceSize: Size(_double500, Images.values.length * _double300),
    );

    await screenMatchesGolden(tester, 'images');
  });
}
