import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/features/shared/domain/entities/tokens_entity.dart';

/// {@template refresh_tokens_repository.class}
/// Interface IRefreshTokensRepository.
/// {@endtemplate}
abstract interface class IRefreshTokensRepository {
  /// Refresh Tokens
  RequestOperation<TokensEntity> refreshTokens(String refreshToken);

  /// Initialize repository
  RequestOperation<void> saveTokens(TokensEntity tokens);

  /// Get Access Token from storage
  RequestOperation<String?> getAccessToken();

  /// Get Refresh Token from storage
  RequestOperation<String?> getRefreshToken();
}
