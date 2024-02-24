// ignore_for_file: avoid_implementing_value_types, avoid-async-call-in-sync-function, prefer-explicit-type-arguments, avoid-dynamic
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/i_theme_service.dart';
import 'package:flutter_template/features/app/di/app_scope.dart';
import 'package:flutter_template/l10n/app_localizations.g.dart';
import 'package:flutter_template/uikit/colors/app_color_scheme.dart';
import 'package:flutter_template/uikit/themes/app_theme_data.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../core/utils/test_widget.dart';

final _appScopeMock = AppScopeMock();
final _themeServiceMock = ThemeServiceMock();

/// Widget under test wrapper. Provides essential dependencies such as theme, color scheme, and fonts.
class BaseWidgetTestWrapper extends StatelessWidget {
  BaseWidgetTestWrapper({
    required this.child,
    required this.mode,
    MockStackRouter? router,
    super.key,
  }) {
    registerFallbackValue(FakePageRouteInfo());
    mockRouter = router ?? MockStackRouter();
    when(() => _appScopeMock.themeService).thenReturn(_themeServiceMock);
    when(() => _themeServiceMock.currentThemeMode).thenReturn(
      mode == ThemeType.dark ? ThemeMode.dark : ThemeMode.light,
    );
    if (router == null) {
      when(() => mockRouter.push(any())).thenAnswer((_) => Future.value());
    }
  }

  final Widget child;
  final ThemeType mode;
  late final MockStackRouter mockRouter;

  @override
  Widget build(BuildContext context) {
    intl.Intl.systemLocale = 'ru';
    initializeDateFormatting();

    return materialAppWrapper(
      localizations: AppLocalizations.localizationsDelegates,
      localeOverrides: AppLocalizations.supportedLocales,
      theme: mode == ThemeType.dark
          ? AppThemeData.darkTheme
          : AppThemeData.lightTheme,
    )(
      StackRouterScope(
        controller: mockRouter,
        stateHash: 0,
        child: MultiProvider(
          providers: [
            Provider<IAppScope>(create: (_) => _appScopeMock),
            Provider<AppColorScheme>(
              create: (_) => mode == ThemeType.dark
                  ? AppColorScheme.dark()
                  : AppColorScheme.light(),
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

class ThemeServiceMock extends Mock implements IThemeService {}

class AutoRouterMock extends Mock implements StackRouter {}

class MockStackRouter extends Mock implements StackRouter {}

class FakePageRouteInfo extends Fake implements PageRouteInfo<dynamic> {}
