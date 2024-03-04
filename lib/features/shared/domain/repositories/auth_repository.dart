// ignore_for_file: one_member_abstracts
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';

/// {@template auth_repository.class}
/// Interface AuthRepository.
/// {@endtemplate}
abstract interface class IAuthRepository {
  /// Logout.
  RequestOperation<void> logout();
}
