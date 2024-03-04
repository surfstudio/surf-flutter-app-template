/// Storage for tokens
abstract interface class ITokensStorage {
  /// Get accessToken
  Future<String?> accessToken();

  /// Save accessToken
  Future<void> saveAccessToken(String accessToken);

  /// Get refreshToken
  Future<String?> refreshToken();

  /// Save refreshToken
  Future<void> saveRefreshToken(String refreshToken);

  /// Clear storage
  Future<void> clear();
}
