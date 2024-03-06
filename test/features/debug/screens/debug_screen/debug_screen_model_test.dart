import 'package:flutter_template/common/utils/logger/i_log_writer.dart';
import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/features/debug/presentation/debug/debug_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDebugRepository extends Mock implements IDebugRepository {}

class MockLogWriter extends Mock implements ILogWriter {}

void main() {
  late DebugModel model;
  final debugRepository = MockDebugRepository();
  final logWriter = MockLogWriter();
  const serverUrl = Url.dev;
  const proxyMock = 'proxy';

  setUpAll(() {
    model = DebugModel(
      debugRepository: debugRepository,
      logWriter: logWriter,
    );

    when(() => debugRepository.saveServerUrl(serverUrl)).thenAnswer((_) => Future.value(const Result.ok(null)));
    when(() => debugRepository.saveProxyUrl(proxyMock)).thenAnswer((_) => Future.value(const Result.ok(null)));
  });

  test(
    'Save server',
    () async {
      await model.saveServerUrl(serverUrl);
      final _ = verify(() => debugRepository.saveServerUrl(serverUrl));
    },
  );

  test(
    'Save proxy',
    () async {
      await model.saveProxyUrl(proxyMock);
      final _ = verify(() => debugRepository.saveProxyUrl(proxyMock));
    },
  );
}
