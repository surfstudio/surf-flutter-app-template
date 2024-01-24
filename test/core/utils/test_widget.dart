// ignore_for_file: comment_references, depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/assets/colors/color_scheme.dart';
import 'package:flutter_template/assets/text/text_extention.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:meta/meta.dart';

import '../../flutter_test_config.dart';
import '../../mocks/base_widget_test_wrapper.dart';
import 'testing_theme.dart';

typedef TestFunctionWithTheme = Future<dynamic> Function(WidgetTester, ThemeData);

/// Performs testing of the widget of type [T].
///
/// - [widgetBuilder] - function that returns the widget to be tested.
/// - [desc] - test description.
/// - [router] - optionally provided router.
/// - [setup] - function that sets up configurations before the test. It provides the application theme.
/// - [test] - function containing the actual test. It provides [WidgetTester] and the application theme. No need to call [WidgetTester.pumpWidgetBuilder].
/// - [withGolden] - flag to determine if golden file updates should be performed for this widget.
/// - [deviceMatters] - flag to determine if golden files should be generated for different devices.
/// - [screenState] - string that allows specifying the screen state (e.g., loading, error).
/// - [skip] - Allows skipping the test.
/// - [onlyOneTheme] - Uses only one of the themes for the test (the first one from the list).
@isTest
void testWidget<T extends Widget>({
  required Widget Function(ThemeData) widgetBuilder,
  String? desc,
  MockStackRouter? router,
  TestFunctionWithTheme? test,
  void Function(ThemeData, ThemeMode, AppLocalizations)? setup,
  bool withGolden = true,
  bool deviceMatters = true,
  bool autoHeight = false,
  bool? skip,
  String? screenState,
  bool onlyOneTheme = false,
}) =>
    testGoldens(
      desc ?? 'Golden for $T',
      skip: skip,
      (tester) async {
        await loadAppFonts();

        final locale = AppLocalizations.supportedLocales.firstOrNull ??
            (throw Exception('No supported locales'));
        final l10n = await AppLocalizations.delegate.load(locale);

        final List<TestingTheme> themesForTest;

        // If the theme is not important for the test, the first one from the list will be used.
        themesForTest = onlyOneTheme ? [themesForTesting.first] : themesForTesting;

        /// Iterate over each theme.
        for (final theme in themesForTest) {
          final scheme = theme.data.customColorScheme;

          /// Call setup if available.
          setup?.call(theme.data, theme.type.toThemeMode, l10n);

          final widget = widgetBuilder(theme.data);

          await tester.pumpWidgetBuilder(
            ColoredBox(
              color: scheme.background,
              child: widget,
            ),
            wrapper: (child) => BaseWidgetTestWrapper(
              child: child,
              mode: theme.type,
              router: router,
            ),
          );

          /// Call the test if available.
          await test?.call(tester, theme.data);

          if (withGolden) {
            /// Generate golden files.
            await multiScreenGolden(
              tester,
              _getGoldenName<T>(
                theme,
                screenState,
                includeThemeName: !onlyOneTheme,
              ),
              devices: deviceMatters ? null : [Device.phone],
              autoHeight: autoHeight,
            );

            await tester.pumpWidget(Container());
          }
        }
      },
    );

/// Forms the name of the golden file from:
/// - widget type [T] (converts camelCase to snake_case - e.g., `LoadStoreScreen` -> `load_store_screen`)
///   - if the widget has generic parameter, it will also be converted to snake_case
/// - theme prefix (`dark_theme`/`light_theme`)
/// - screen state [state], if provided (e.g., `loading`, 'loading state' -> 'loading_state')
/// - [includeThemeName] - whether to include the theme name in the file name
///
/// Example value: `dark_theme.loading.load_store_screen`
String _getGoldenName<T>(
  TestingTheme theme,
  String? state, {
  bool includeThemeName = true,
}) {
  final exp = RegExp('(?<=[a-z])[A-Z]');
  final name = T
      .toString()
      .replaceAllMapped(exp, (m) => '_${m.group(0)}')
      .toLowerCase()
      .replaceAll('<', '_')
      .replaceAll('>', '');

  final formattedState = state?.trim().replaceAll(' ', '_');

  return '${includeThemeName ? theme.stringified : 'no_theme'}${formattedState == null ? '.' : '.$formattedState.'}$name';
}

enum ThemeType {
  dark,
  light;

  ThemeMode get toThemeMode {
    switch (this) {
      case ThemeType.dark:
        return ThemeMode.dark;
      case ThemeType.light:
        return ThemeMode.light;
    }
  }

  const ThemeType();
}

extension ThemeDataExt on ThemeData {
  AppColorScheme get customColorScheme =>
      extension<AppColorScheme>() ?? (throw Exception('no AppColorScheme'));
  AppTextTheme get customTextTheme =>
      extension<AppTextTheme>() ?? (throw Exception('no AppTextTheme'));
}
