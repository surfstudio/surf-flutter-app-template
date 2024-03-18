import 'package:flutter_template/persistence/storage/tokens_storage/data/auth_tokens_storage_dto.dart';

/// Storage for tokens
abstract interface class ITokensStorage {
  /// Get accessToken
  Future<String?> get accessToken;

  /// Get refreshToken
  Future<String?> get refreshToken;

  /// Save tokens
  Future<void> saveTokens(AuthTokensStorageDto tokens);

  /// Clear storage
  Future<void> clear();
}
