import 'package:flutter_template/features/common/data/repository/api_caller_repository_mixin.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';
import 'package:flutter_template/features/common/domain/repository/auth_repository.dart';

/// {@template auth_repository.class}
/// Implementation AuthRepository.
/// {@endtemplate}
final class AuthRepository with ApiCallerRepositoryMixin implements IAuthRepository {
  /// {@macro auth_repository.class}
  AuthRepository();

  @override
  RequestOperation<void> logout() async {
    // TODO(anyone): implement logout
    try {
      return const Result.ok(null);
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }
}
