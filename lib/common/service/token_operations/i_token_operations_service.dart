import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/data/auth_tokens_storage_dto.dart';

/// Interface for the token management service.
abstract interface class ITokenOperationsService {
  /// Refresh Tokens.
  RequestOperation<AuthTokensStorageDto> refreshTokens(String refreshToken);

  /// Refresh token.
  Future<void> saveTokens(AuthTokensStorageDto tokens);

  /// Get Access Token from storage.
  Future<String?> getAccessToken();

  /// Get Refresh Token from storage.
  Future<String?> getRefreshToken();
}
