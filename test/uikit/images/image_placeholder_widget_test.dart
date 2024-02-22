import 'package:flutter/material.dart';
import 'package:flutter_template/assets/resources.dart';
import 'package:flutter_template/uikit/images/image_placeholder_widget.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens(
    'Golden Image placeholder',
    (tester) async {
      final builder = GoldenBuilder.column(
        bgColor: Colors.white,
      )
        ..addScenario(
          'Without size and icons',
          const ImagePlaceholderWidget(),
        )
        ..addScenario(
          'With small size',
          const ImagePlaceholderWidget(size: Size(20, 20)),
        )
        ..addScenario(
          'With big size',
          const ImagePlaceholderWidget(size: Size(200, 200)),
        )
        ..addScenario(
          'With other icon',
          const ImagePlaceholderWidget(size: Size(50, 50), assetName: SvgIcons.testSvg),
        );

      await tester.pumpWidgetBuilder(builder.build(), surfaceSize: const Size(400, 600));

      await screenMatchesGolden(tester, 'image_placeholder_widget');
    },
  );
}
