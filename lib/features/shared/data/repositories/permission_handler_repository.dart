import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/shared/domain/entities/failure/permission_failure.dart';
import 'package:flutter_template/features/shared/domain/repositories/i_permission_handler_repository.dart';
import 'package:permission_handler/permission_handler.dart';

/// Implementation of [PermissionHandlerRepository] for obtaining permissions from the user.
class PermissionHandlerRepository implements IPermissionHandlerRepository {
  /// Create an instance of [PermissionHandlerRepository].
  PermissionHandlerRepository();

  @override
  Future<PermissionResult> checkPermission(Permission permission) async {
    final status = await permission.status;

    if (status.isGranted) {
      return const Result.ok(null);
    }

    if (status.isDenied) {
      final status = await permission.request();

      if (status.isGranted) {
        return const Result.ok(null);
      } else {
        return Result.failed(PermissionDenied(original: null, trace: null));
      }
    }

    if (status.isPermanentlyDenied) {
      return Result.failed(PermissionDeniedForever(original: null, trace: null));
    }

    return Result.failed(PermissionException(original: null, trace: null));
  }
}
