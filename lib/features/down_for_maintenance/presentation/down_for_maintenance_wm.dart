import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/down_for_maintenance/data/services/mock_check_server_status_service.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/entities/check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/services/check_server_status_service.dart';
import 'package:flutter_template/features/down_for_maintenance/presentation/down_for_maintenance_widget.dart';

/// Factory that creates DownForMaintenanceWM.
DownForMaintenanceWM defaultDownForMaintenanceWMFactory(BuildContext context) {
  return DownForMaintenanceWM(MockCheckServerStatusService());
}

/// WidgetModel for DownForMaintenanceWidget.
class DownForMaintenanceWM extends WidgetModel<DownForMaintenanceWidget, _StubModel> implements IDownForMaintenanceWM {
  final ICheckServerStatusService _checkServerStatusService;

  @override
  ValueListenable<ServerCheckResult> get currentResult => _checkServerStatusService.serverStatus;

  /// @nodoc
  DownForMaintenanceWM(this._checkServerStatusService) : super(_StubModel());

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

/// Interface for DownForMaintenanceWM.
abstract interface class IDownForMaintenanceWM implements IWidgetModel {
  /// Current state of server.
  ValueListenable<ServerCheckResult> get currentResult;

  /// Callback that initiate check of current server status.
  void onCheckCurrentStatusPressed();
}

class _StubModel extends ElementaryModel {}
