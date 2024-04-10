import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/common/widgets/di_scope.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/features/theme_mode/presentation/theme_mode_controller.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:flutter_template/uikit/themes/app_theme_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:surf_widget_test_composer/surf_widget_test_composer.dart' as helper;

typedef OnTestMain = FutureOr<void> Function();

class MockAppScope extends Mock implements IAppScope {}

class MockThemeModeController extends Mock implements ThemeModeController {}

Future<void> testExecutable(OnTestMain testMain) {
  final mockAppScope = MockAppScope();

  final themeController = MockThemeModeController();

  final themes = [
    helper.TestingTheme(
      data: AppThemeData.darkTheme,
      stringified: 'dark',
      type: helper.ThemeType.dark,
    ),
    helper.TestingTheme(
      data: AppThemeData.lightTheme,
      stringified: 'light',
      type: helper.ThemeType.light,
    ),
  ];

  final devices = [
    helper.TestDevice(
      // ignore: double-literal-format
      size: const Size(414, 896),
      name: 'iphone11',
      // ignore: double-literal-format
      safeArea: const EdgeInsets.only(top: 44, bottom: 34),
    ),
    helper.TestDevice(
      // ignore: double-literal-format
      size: const Size(393, 851),
      name: 'pixel 4a',
    ),
    helper.TestDevice(
      // ignore: double-literal-format
      size: const Size(320, 568),
      name: 'iphone_se_1',
    ),
  ];

  return helper.testExecutable(
    testMain: testMain,
    themes: themes,
    wrapper: (child, mode, theme, localizations, locales) => helper.BaseWidgetTestWrapper(
      childBuilder: child,
      mode: mode,
      themeData: theme,
      dependencies: (widget) {
        when(() => themeController.themeMode).thenReturn(ValueNotifier(mode.toThemeMode));

        return DiScope<IAppScope>(
          factory: (_) => mockAppScope,
          child: Provider<ThemeModeController>.value(
            value: themeController,
            child: widget,
          ),
        );
      },
      localizations: _localizationsDelegates,
      localeOverrides: _localizations,
    ),
    backgroundColor: (theme) => theme.colorScheme.background,
    devicesForTest: devices,
    customComparator: CustomFileComparator(
      '${(goldenFileComparator as LocalFileComparator).basedir}/goldens',
    ),
  );
}

const _localizations = [
  Locale('en', 'EN'),
  Locale('ru', 'RU'),
];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

class CustomFileComparator extends LocalFileComparator {
  static const _tolerance = 0.18;
  static const _logLevel = 1999;
  static const _hundredPrecent = 100;

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
        'A tolerable difference of ${result.diffPercent * _hundredPrecent}% was found when comparing $golden.',
        level: _logLevel,
      );
    }

    return result.passed || result.diffPercent <= _tolerance;
  }
}
