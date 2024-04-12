// ignore_for_file: one_member_abstracts
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/shared/domain/entities/failure/permission_failure.dart';
import 'package:permission_handler/permission_handler.dart';

/// Typedef for the result of a request for user permissions.
typedef PermissionResult = Result<void, PermissionFailure>;

/// Interface of the repository for obtaining permissions from the user.
abstract class IPermissionHandlerRepository {
  /// Check the permission for the use of [permission].
  Future<PermissionResult> checkPermission(Permission permission);
}
