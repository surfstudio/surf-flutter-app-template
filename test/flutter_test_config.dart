import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'core/utils/testing_theme.dart';

const _tolerance = 0.18;

const _devices = [
  Device.iphone11,
  Device.phone,

  /// some custom device.
  Device(name: 'pixel 4a', size: Size(393, 851)),
];

/// List of themes used for testing.
final themesForTesting = [
  TestingTheme.light(),
  TestingTheme.dark(),
];

Future<void> testExecutable(FutureOr<void> Function() testMain) {
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
        'A tolerable difference of ${result.diffPercent * 100}% was found when comparing $golden.',
        level: 2000,
      );
    }

    return result.passed || result.diffPercent <= _tolerance;
  }
}
