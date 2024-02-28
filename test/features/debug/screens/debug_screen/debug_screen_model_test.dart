import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/theme_service.dart';
import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/domain/entities/url_type_entity.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/callback_mock.dart';

class MockDebugRepository extends Mock implements IDebugRepository {}

class MockThemeService extends Mock implements IThemeService {}

class MockLogWriter extends Mock implements ILogWriter {}

void main() {
  late DebugScreenModel model;
  final debugRepository = MockDebugRepository();
  final themeService = MockThemeService();
  final logWriter = MockLogWriter();
  final config = AppConfig(url: Url.qaUrl);

  final appRebuilder = VoidCallbackMock();

  setUpAll(() {
    model = DebugScreenModel(
      debugRepository,
      config,
      themeService,
      logWriter: logWriter,
    );

    when(() => themeService.currentThemeMode).thenReturn(ThemeMode.light);
  });

  group(
    'Network config: ',
    () {
      const proxyMock = 'proxy';

      test(
        'Switch server',
        () {
          model
            ..init()
            ..switchServer(UrlTypeEntity.prod);
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
