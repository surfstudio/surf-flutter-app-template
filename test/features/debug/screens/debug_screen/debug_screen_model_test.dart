// ignore_for_file: avoid-ignoring-return-values
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/i_theme_service.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_wm.dart';
import 'package:flutter_template/persistence/storage/config_storage/i_config_settings_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/callback_mock.dart';

class MockErrorHandler extends Mock implements ErrorHandler {}

class MockEnvironment extends Mock implements Environment {}

class MockConfigSettingsStorage extends Mock implements IConfigSettingsStorage {}

class MockThemeService extends Mock implements IThemeService {}

void main() {
  late DebugModel model;
  final errorHandler = MockErrorHandler();
  final env = MockEnvironment();
  final configSettingsStorage = MockConfigSettingsStorage();
  final themeService = MockThemeService();
  final config = AppConfig(url: Url.testUrl);

  final appRebuilder = VoidCallbackMock();

  setUpAll(() {
    model = DebugModel(
      errorHandler,
      env,
      appRebuilder,
      configSettingsStorage,
      themeService,
    );

    when(() => env.config).thenReturn(config);
    when(() => themeService.currentThemeMode).thenReturn(ThemeMode.light);
  });

  group(
    'Network config: ',
    () {
      const proxyMock = 'proxy';
      setUp(() {
        when(() => env.saveConfigProxy(configSettingsStorage)).thenAnswer((_) => Future<void>.value());
      });

      test(
        'Switch server',
        () {
          model
            ..init()
            ..switchServer(UrlType.prod);
          verify(appRebuilder);
        },
      );

      test(
        'Set proxy',
        () {
          model
            ..init()
            ..setProxy(proxyMock);
          verify(appRebuilder);
        },
      );
    },
  );

  group(
    'Theme config: ',
    () {
      const targetMode = ThemeMode.dark;
      setUp(() {
        when(() => themeService.updateThemeMode(targetMode));
      });

      test(
        'Change theme',
        () {
          model
            ..init()
            ..setThemeMode(targetMode);

          verify(() => themeService.updateThemeMode(targetMode));
        },
      );
    },
  );
}
