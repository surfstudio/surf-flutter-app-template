// ignore_for_file: avoid_implementing_value_types
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:flutter_template/uikit/colors/color_scheme.dart';
import 'package:flutter_template/uikit/themes/theme_data.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../core/utils/test_widget.dart';

/// Widget under test wrapper. Provides essential dependencies such as theme, color scheme, and fonts.
class BaseWidgetTestWrapper extends StatelessWidget {
  final Widget child;
  final ThemeType mode;
  late final MockStackRouter mockRouter;
  final appScopeMock = AppScopeMock();

  BaseWidgetTestWrapper({
    required this.child,
    required this.mode,
    MockStackRouter? router,
    super.key,
  }) {
    registerFallbackValue(FakePageRouteInfo());
    mockRouter = router ?? MockStackRouter();
    if (router == null) {
      when(() => mockRouter.push(any())).thenAnswer((_) => Future.value());
    }
  }

  @override
  Widget build(BuildContext context) {
    intl.Intl.systemLocale = 'ru';
    initializeDateFormatting();
    return materialAppWrapper(
      theme: mode == ThemeType.dark ? AppThemeData.darkTheme : AppThemeData.lightTheme,
      localizations: AppLocalizations.localizationsDelegates,
      localeOverrides: AppLocalizations.supportedLocales,
    )(
      StackRouterScope(
        controller: mockRouter,
        stateHash: 0,
        child: MultiProvider(
          providers: [
            Provider<IAppScope>(create: (_) => appScopeMock),
            Provider<AppColorScheme>(
              create: (_) =>
                  mode == ThemeType.dark ? AppColorScheme.dark() : AppColorScheme.light(),
            ),
          ],
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: child,
          ),
        ),
      ),
    );
  }
}

class AppScopeMock extends Mock implements IAppScope {}

class AutoRouterMock extends Mock implements StackRouter {}

class MockStackRouter extends Mock implements StackRouter {}

class FakePageRouteInfo extends Fake implements PageRouteInfo<dynamic> {}
