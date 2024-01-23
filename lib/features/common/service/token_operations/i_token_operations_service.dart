import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';

/// Interface for the token management service
abstract interface class ITokenOperationsService<T extends Object, E extends Object> {
  /// refresh Tokens
  Future<Result<T, Failure<E>>> refreshTokens(String refreshToken);

  /// Refresh token
  Future<void> saveTokens(T tokens);

  /// Get Access Token from storage
  Future<String?> getAccessToken();

  /// Get Refresh Token from storage
  Future<String?> getRefreshToken();
}
