import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'core/utils/testing_theme.dart';

const _tolerance = 0.18;
const _double393 = 393.0;
const _double851 = 851.0;
const _double100 = 100.0;
const _int2000 = 2000;

const _devices = [
  Device.iphone11,
  Device.phone,

  /// some custom device.
  Device(size: Size(_double393, _double851), name: 'pixel 4a'),
];

typedef OnTestMain = FutureOr<void> Function();

/// List of themes used for testing.
final themesForTesting = [
  TestingTheme.light(),
  TestingTheme.dark(),
];

Future<void> testExecutable(OnTestMain testMain) {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();

      if (goldenFileComparator is LocalFileComparator) {
        goldenFileComparator = CustomFileComparator(
          '${(goldenFileComparator as LocalFileComparator).basedir}/goldens',
        );
      }
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: _devices,
      enableRealShadows: true,
    ),
  );
}

class CustomFileComparator extends LocalFileComparator {
  CustomFileComparator(String testFile) : super(Uri.parse(testFile));

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (!result.passed && result.diffPercent >= _tolerance) {
      final error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }
    if (!result.passed) {
      log(
        'A tolerable difference of ${result.diffPercent * _double100}% was found when comparing $golden.',
        level: _int2000,
      );
    }

    return result.passed || result.diffPercent <= _tolerance;
  }
}
