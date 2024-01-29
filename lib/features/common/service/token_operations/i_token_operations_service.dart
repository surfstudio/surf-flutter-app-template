import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';
import 'package:flutter_template/features/common/domain/entity/tokens/tokens_entity.dart';

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
