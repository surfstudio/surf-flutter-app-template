import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/entities/check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/services/check_server_status_service.dart';

/// Implementation of [ICheckServerStatusService] that uses REST API to check server status.
class RestCheckServerStatusService implements ICheckServerStatusService {
  // ignore: unused_field
  final Dio _dio;

  /// @nodoc
  RestCheckServerStatusService(this._dio);

  @override
  ValueNotifier<ServerCheckResult> serverStatus = ValueNotifier(ServerCheckResult.processing);

  @override
  Future<void> configurate() async {
    /// Here you can configurate your client to make requests every n minutes for example.
    /// For example:
    ///
    // _timer = Timer.periodic(Duration(minutes: 5), (timer) {
    //      initImmediateCheck();
    //   });
  }

  @override
  void initImmediateCheck() {
    /// Here you can make a request to your server to check if it is available.
  }

  @override
  void dispose() {
    // _timer.cancel();
  }
}
