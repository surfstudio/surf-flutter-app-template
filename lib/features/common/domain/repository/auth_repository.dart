// ignore_for_file: one_member_abstracts
import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';

/// {@template auth_repository.class}
/// Interface AuthRepository.
/// {@endtemplate}
abstract interface class IAuthRepository {
  /// logout
  RequestOperation<void> logout();
}
