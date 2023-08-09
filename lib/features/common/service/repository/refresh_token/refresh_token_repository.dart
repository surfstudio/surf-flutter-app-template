/// Repository for token refresh operation.
abstract class IRefreshTokenRepository {
  /// Returns true if a refresh token is present in the storage.
  Future<bool> get hasRefreshToken;

  /// Request to refresh the authorization token.
  ///
  /// Logs the user out in case the refresh is unsuccessful.
  Future<void> refreshToken();
}
