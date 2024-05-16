import 'package:flutter_template/features/down_for_maintenance/domain/entities/server_check_result.dart';
import 'package:flutter_template/features/down_for_maintenance/domain/repository/i_check_server_status_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Implementation of [ICheckServerStatusRepository] that uses Firebase Remote Config to check server status.
class FirebaseCheckServerStatusRepository implements ICheckServerStatusRepository {
  @override
  final BehaviorSubject<ServerCheckResult> serverStatus = BehaviorSubject.seeded(ServerCheckResult.processing);

  @override
  Future<void> configurate() async {
    /// Here you can configurate your Firebase Remote Config interval of requests for example.
    /// For example:
    //
    // await remoteConfig.setConfigSettings(RemoteConfigSettings(
    // fetchTimeout: const Duration(minutes: 1),
    // minimumFetchInterval: const Duration(hours: 1),
    // ));
    //
  }

  @override
  Future<void> initImmediateCheck() async {
    /// Here you can make a request to your Firebase Remote Config to check if it is available.
    /// For example:
    // try {
    //   await remoteConfig.fetchAndActivate();
    //   final isServerAvailable = remoteConfig.getBool('is_server_available');
    //   serverStatus.value = isServerAvailable ? ServerCheckResult.worksNormally : ServerCheckResult.notActive;
    // } on Exception catch (_) {
    //   serverStatus.value = ServerCheckResult.errorOccurred;
    // }
  }

  @override
  void dispose() {
    serverStatus.close();
  }
}
