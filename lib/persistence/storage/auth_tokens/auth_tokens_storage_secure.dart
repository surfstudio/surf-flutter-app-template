import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/persistence/storage/auth_tokens/auth_tokens_storage.dart';
import 'package:flutter_template/persistence/storage/auth_tokens/data/auth_tokens.dart';

/// Implementation of token storage using SecureStorage.
class AuthTokensStorageSecure implements IAuthTokensStorage {
  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';
  static const _expiresAtKey = 'expiresAt';

  final FlutterSecureStorage _secureStorage;

  /// Retrieves the access token from the storage.
  @override
  Future<String?> get accessToken => _secureStorage.read(key: _accessTokenKey);

  /// Retrieves the refresh token from the storage.
  @override
  Future<String?> get refreshToken =>
      _secureStorage.read(key: _refreshTokenKey);

  /// Retrieves the expiration date of the access token from the storage.
  @override
  Future<DateTime?> get accessTokenExpireDate async {
    final expiresAt = await _secureStorage.read(key: _expiresAtKey);
    return expiresAt != null ? DateTime.parse(expiresAt) : null;
  }

  /// Creates an instance of AuthTokensStorageSecure.
  ///
  /// [_secureStorage] is an instance of FlutterSecureStorage used for data storage.
  AuthTokensStorageSecure(this._secureStorage);

  /// Saves the provided tokens securely.
  ///
  /// [tokens] is an instance of AuthTokensStorageDto containing the tokens and expiration date.
  @override
  Future<void> saveTokens(AuthTokensStorageDto tokens) async {
    await _secureStorage.write(
      key: _accessTokenKey,
      value: tokens.accessToken,
    );
    await _secureStorage.write(
      key: _expiresAtKey,
      value: tokens.expiresAt.toIso8601String(),
    );
    await _secureStorage.write(
      key: _refreshTokenKey,
      value: tokens.refreshToken,
    );
  }

  /// Removes the stored tokens from the secure storage.
  @override
  Future<void> removeTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _expiresAtKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
}
