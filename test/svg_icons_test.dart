import 'dart:io';

import 'package:flutter_template/assets/res/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.testSvg).existsSync(), isTrue);
  });
}
