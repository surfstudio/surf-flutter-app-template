import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/down_by_maintenance/data/services/mock_check_server_status_service.dart';
import 'package:flutter_template/features/down_by_maintenance/domain/entities/check_result.dart';
import 'package:flutter_template/features/down_by_maintenance/domain/services/check_server_status_service.dart';
import 'package:flutter_template/features/down_by_maintenance/presentation/down_by_maintenance_widget.dart';

/// Factory that creates DownByMaintenanceWM.
DownByMaintenanceWM createDownByMaintenanceWM(BuildContext context) {
  return DownByMaintenanceWM(MockCheckServerStatusService());
}

/// WidgetModel for DownByMaintenanceWidget.
class DownByMaintenanceWM extends WidgetModel<DownByMaintenanceWidget, _StubModel> implements IDownByMaintenanceWM {
  final ICheckServerStatusService _checkServerStatusService;

  @override
  ValueListenable<ServerCheckResult> get currentResult => _checkServerStatusService.serverStatus;

  /// @nodoc
  DownByMaintenanceWM(this._checkServerStatusService) : super(_StubModel());

  @override
  void initWidgetModel() {
    _checkServerStatusService.configurate();
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _checkServerStatusService.dispose();
    super.dispose();
  }

  @override
  void onCheckCurrentStatusPressed() {
    _checkServerStatusService.initImmediateCheck();
  }
}

/// Interface for DownByMaintenanceWM.
abstract interface class IDownByMaintenanceWM implements IWidgetModel {
  /// Current state of server.
  ValueListenable<ServerCheckResult> get currentResult;

  /// Callback that initiate check of current server status.
  void onCheckCurrentStatusPressed();
}

class _StubModel extends ElementaryModel {}
