import 'dart:async';

import 'package:flutter_template/features/down_for_maintenance/domain/entities/server_check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/repository/i_check_server_status_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Implementation of [ICheckServerStatusRepository] that mocks server status.
class MockCheckServerStatusRepository implements ICheckServerStatusRepository {
  @override
  final BehaviorSubject<ServerCheckResult> serverStatus = BehaviorSubject.seeded(ServerCheckResult.processing);

  late final Timer _timer;

  @override
  Future<void> configurate() async {
    _check().ignore();
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) {
      _check();
    });
  }

  @override
  void initImmediateCheck() {
    serverStatus.value = ServerCheckResult.processing;
    _check();
  }

  Future<void> _check() async {
    await Future.delayed(const Duration(seconds: 1));
    serverStatus.value = ServerCheckResult.worksNormally;
  }

  @override
  void dispose() {
    _timer.cancel();
    serverStatus.close();
  }
}
