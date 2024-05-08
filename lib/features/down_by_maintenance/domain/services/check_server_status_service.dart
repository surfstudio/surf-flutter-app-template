import 'package:flutter/foundation.dart';
import 'package:flutter_template/features/down_by_maintenance/domain/entities/check_result.dart';

/// Interface for checking server status.
abstract interface class ICheckServerStatusService {
  /// Current state of server.
  ValueListenable<ServerCheckResult> get serverStatus;

  /// Method that initiate check of current server status.
  void initImmediateCheck();

  /// Method that configurate service. For example, you can configurate interval of requests.
  Future<void> configurate();

  /// Method that dispose service. For example, you can cancel timers.
  void dispose();
}
