import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/entities/server_check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/repository/i_check_server_status_repository.dart';

/// Model with businness-logic for Down For Maintenance feature.
class DownForMaintenanceModel extends ElementaryModel {
  final ICheckServerStatusRepository _checkServerStatusRepository;
  final _serverCheckResult = ValueNotifier(ServerCheckResult.processing);

  /// Current server status.
  ValueListenable<ServerCheckResult> get serverCheckResult => _serverCheckResult;
  late StreamSubscription<ServerCheckResult> _streamSubscription;

  /// @nodoc
  DownForMaintenanceModel(this._checkServerStatusRepository);

  @override
  void init() {
    _streamSubscription = _checkServerStatusRepository.serverStatus.listen((event) {
      _serverCheckResult.value = event;
    });
    super.init();
  }

  /// Initiates immediate check of server status.
  void initImmediateCheck() {
    _checkServerStatusRepository.initImmediateCheck();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _serverCheckResult.dispose();
    _checkServerStatusRepository.dispose();
    super.dispose();
  }
}
