import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';
import 'package:flutter_template/features/common/domain/entity/tokens/tokens_entity.dart';

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
