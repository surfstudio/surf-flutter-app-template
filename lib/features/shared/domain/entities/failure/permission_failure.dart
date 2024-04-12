import 'package:flutter_template/core/architecture/domain/entity/failure.dart';

/// Statuses of the user permission request error.
sealed class PermissionFailure extends Failure {
  PermissionFailure({required super.original, required super.trace});
}

/// Access denied.
final class PermissionDenied extends PermissionFailure {
  /// Create an instance of [PermissionDenied].
  PermissionDenied({required super.original, required super.trace});
}

/// Access denied forever.
final class PermissionDeniedForever extends PermissionFailure {
  /// Create an instance of [PermissionDeniedForever].
  PermissionDeniedForever({required super.original, required super.trace});
}

/// Service unavailable.
final class ServiceDisabled extends PermissionFailure {
  /// Create an instance of [ServiceDisabled].
  ServiceDisabled({required super.original, required super.trace});
}

/// Other errors when requesting user permissions.
final class PermissionException extends PermissionFailure {
  /// Create an instance of [PermissionException].
  PermissionException({required super.original, required super.trace});
}
