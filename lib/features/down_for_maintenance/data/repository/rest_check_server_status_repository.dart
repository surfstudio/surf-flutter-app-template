import 'package:dio/dio.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/entities/server_check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/repository/i_check_server_status_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Implementation of [ICheckServerStatusRepository] that uses REST API to check server status.
class RestCheckServerStatusRepository implements ICheckServerStatusRepository {
  // ignore: unused_field
  final Dio _dio;

  /// @nodoc
  RestCheckServerStatusRepository(this._dio);

  @override
  final BehaviorSubject<ServerCheckResult> serverStatus = BehaviorSubject.seeded(ServerCheckResult.processing);

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
    serverStatus.close();
  }
}
