import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/i_tokens_storage.dart';

/// {@template tokens_storage.class}
/// Implementation [ITokensStorage]
/// {@endtemplate}
final class TokensStorage implements ITokensStorage {
  final FlutterSecureStorage _secureStorage;

  /// {@macro tokens_storage.class}
  const TokensStorage(this._secureStorage);

  @override
  Future<String?> accessToken() {
    return _secureStorage.read(key: TokensStorageKeys.accessToken.keyName);
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await _secureStorage.write(key: TokensStorageKeys.accessToken.keyName, value: accessToken);
  }

  @override
  Future<String?> refreshToken() {
    return _secureStorage.read(key: TokensStorageKeys.refreshToken.keyName);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await _secureStorage.write(key: TokensStorageKeys.refreshToken.keyName, value: refreshToken);
  }

  @override
  Future<void> clear() async {
    for (final key in TokensStorageKeys.values) {
      await _secureStorage.delete(key: key.keyName);
    }
  }
}

/// Keys for [TokensStorage]
enum TokensStorageKeys {
  /// @nodoc
  accessToken('app_access_token'),

  /// @nodoc
  refreshToken('app_refresh_token');

  /// Key name
  final String keyName;

  const TokensStorageKeys(this.keyName);
}
