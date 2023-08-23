import 'package:flutter_template/persistence/storage/auth_tokens/data/auth_tokens.dart';

/// Storage for authentication tokens of the application.
abstract class IAuthTokensStorage {
  /// Token used for refreshing the main authentication token.
  Future<String?> get refreshToken;

  /// Authentication token.
  Future<String?> get accessToken;

  /// Expiration date of the access token.
  Future<DateTime?> get accessTokenExpireDate;

  /// Save new tokens.
  Future<void> saveTokens(AuthTokensStorageDto tokens);

  /// Remove user tokens.
  Future<void> removeTokens();
}
