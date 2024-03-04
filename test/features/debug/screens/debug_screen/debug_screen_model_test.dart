import 'package:flutter/material.dart';
import 'package:flutter_template/common/service/theme/theme_service.dart';
import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDebugRepository extends Mock implements IDebugRepository {}

class MockThemeService extends Mock implements IThemeService {}

class MockLogWriter extends Mock implements ILogWriter {}

void main() {
  late DebugScreenModel model;
  final debugRepository = MockDebugRepository();
  final themeService = MockThemeService();
  final logWriter = MockLogWriter();
  const config = AppConfig(url: Url.qa);

  setUpAll(() {
    model = DebugScreenModel(
      debugRepository,
      config,
      themeService,
      logWriter: logWriter,
    );

    registerFallbackValue(Url.prod);

    when(() => debugRepository.saveUrl(any())).thenAnswer(
      (_) => Future.value(const ResultOk(null)),
    );
    when(() => debugRepository.saveProxyUrl(any())).thenAnswer(
      (_) => Future.value(const ResultOk(null)),
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
            ..switchServer(Url.prod);
          verify(() => debugRepository.saveUrl(Url.prod));
        },
      );

      test(
        'Set proxy',
        () {
          model
            ..init()
            ..setProxy(proxyMock);
          verify(() => debugRepository.saveProxyUrl(proxyMock));
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
