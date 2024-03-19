import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/data/auth_tokens_storage_dto.dart';

/// {@template refresh_tokens_repository.class}
/// Interface IRefreshTokensRepository.
/// {@endtemplate}
abstract interface class IRefreshTokensRepository {
  /// Refresh Tokens
  RequestOperation<AuthTokensStorageDto> refreshTokens(String refreshToken);

  /// Initialize repository
  RequestOperation<void> saveTokens(AuthTokensStorageDto tokens);

  /// Get Access Token from storage
  RequestOperation<String?> getAccessToken();

  /// Get Refresh Token from storage
  RequestOperation<String?> getRefreshToken();
}
