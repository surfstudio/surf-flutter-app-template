import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/features/shared/domain/entities/tokens_entity.dart';

/// Interface for the token management service
abstract interface class ITokenOperationsService {
  /// refresh Tokens
  RequestOperation<TokensEntity> refreshTokens(String refreshToken);

  /// Refresh token
  Future<void> saveTokens(TokensEntity tokens);

  /// Get Access Token from storage
  Future<String?> getAccessToken();

  /// Get Refresh Token from storage
  Future<String?> getRefreshToken();
}
