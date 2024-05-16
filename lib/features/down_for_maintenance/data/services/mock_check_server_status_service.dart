import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/entities/check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/services/check_server_status_service.dart';

/// Implementation of [ICheckServerStatusService] that mocks server status.
class MockCheckServerStatusService implements ICheckServerStatusService {
  @override
  final ValueNotifier<ServerCheckResult> serverStatus = ValueNotifier(ServerCheckResult.processing);
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
  }
}
