import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/screens/debug/debug_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/callback_mock.dart';

class MockDebugRepository extends Mock implements IDebugRepository {}

class MockLogWriter extends Mock implements ILogWriter {}

void main() {
  late DebugScreenModel model;
  final debugRepository = MockDebugRepository();
  final logWriter = MockLogWriter();
  const config = AppConfig(url: Url.qa);

  final appRebuilder = VoidCallbackMock();

  setUpAll(() {
    model = DebugScreenModel(
      debugRepository,
      config,
      logWriter: logWriter,
    );
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
}
