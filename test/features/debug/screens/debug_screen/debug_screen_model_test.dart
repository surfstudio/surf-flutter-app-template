import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDebugRepository extends Mock implements IDebugRepository {}

class MockLogWriter extends Mock implements ILogWriter {}

void main() {
  late DebugScreenModel model;
  final debugRepository = MockDebugRepository();
  final logWriter = MockLogWriter();
  const config = AppConfig(url: Url.qa);
  const serverUrl = Url.dev;
  const proxyMock = 'proxy';

  setUpAll(() {
    model = DebugScreenModel(
      debugRepository,
      config,
      logWriter: logWriter,
    );

    when(() => debugRepository.saveUrl(serverUrl)).thenAnswer((_) => Future.value(const Result.ok(null)));
    when(() => debugRepository.saveProxyUrl(proxyMock)).thenAnswer((_) => Future.value(const Result.ok(null)));
  });

  group(
    'Network config: ',
    () {
      const proxyMock = 'proxy';

      test(
        'Switch server',
        () {
          model.switchServer(serverUrl);
          verify(() => debugRepository.saveUrl(serverUrl));
        },
      );

      test(
        'Set proxy',
        () {
          model.setProxy(proxyMock);
          verify(() => debugRepository.saveProxyUrl(proxyMock));
        },
      );
    },
  );
}
