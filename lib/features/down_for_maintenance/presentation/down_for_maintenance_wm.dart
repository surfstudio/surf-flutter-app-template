import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/down_for_maintenance/data/repository/mock_check_server_status_repository.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/entities/server_check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/presentation/down_for_maintenance_model.dart';
import 'package:flutter_template/features/down_for_maintenance/presentation/down_for_maintenance_widget.dart';

/// Factory that creates DownForMaintenanceWM.
DownForMaintenanceWM defaultDownForMaintenanceWMFactory(BuildContext context) {
  return DownForMaintenanceWM(DownForMaintenanceModel(MockCheckServerStatusRepository()));
}

/// WidgetModel for DownForMaintenanceWidget.
class DownForMaintenanceWM extends WidgetModel<DownForMaintenanceWidget, DownForMaintenanceModel>
    implements IDownForMaintenanceWM {
  @override
  ValueListenable<ServerCheckResult> get currentResult => model.serverCheckResult;

  /// @nodoc
  DownForMaintenanceWM(super._model);

  @override
  void onCheckCurrentStatusPressed() {
    model.initImmediateCheck();
  }
}

/// Interface for DownForMaintenanceWM.
abstract interface class IDownForMaintenanceWM implements IWidgetModel {
  /// Current state of server.
  ValueListenable<ServerCheckResult> get currentResult;

  /// Callback that initiate check of current server status.
  void onCheckCurrentStatusPressed();
}
