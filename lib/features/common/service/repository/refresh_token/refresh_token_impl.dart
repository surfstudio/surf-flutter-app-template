import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/entity/failure/server/refresh_token.dart';
import 'package:flutter_template/features/common/service/mappers/dio_error_mapper.dart';
import 'package:flutter_template/features/common/service/repository/refresh_token/refresh_token_repository.dart';
import 'package:flutter_template/persistence/storage/auth_tokens/auth_tokens_storage.dart';

/// Implementation of the token refresh repository.
class RefreshTokenRepositoryImpl implements IRefreshTokenRepository {
  // TODO(anyone): AuthApi
  // TODO(anyone): ILogWriter
  // TODO(anyone): IClearUserDataRepository
  // TODO(anyone): IAuthorizationStatusNotifierRepository
  final IAuthTokensStorage _authTokensStorage;

  @override
  Future<bool> get hasRefreshToken =>
      _authTokensStorage.refreshToken.then((token) => token != null);

  /// Creates an instance of [RefreshTokenRepositoryImpl].
  RefreshTokenRepositoryImpl(
    this._authTokensStorage,
  );

  @override
  Future<void> refreshToken() async {
    try {
      final refreshToken = await _authTokensStorage.refreshToken;
      if (refreshToken == null) {
        // ignore: only_throw_errors
        throw RefreshTokenFailure(
          'Refresh token cannot be null on refresh operation',
        );
      }
      // TODO(anyone): authApi.refreshToken
      // TODO(anyone): saveTokens
    } on DioError catch (e) {
      final failure = DioErrorMapper.mapToFailure(e);

      if (failure is RefreshTokenFailure) {
        // TODO(anyone): log write e
        // TODO(anyone): handleRefreshTokenFailure
      }
    } on Exception catch (e) {
      // TODO(anyone): log write e
      // TODO(anyone): handleRefreshTokenFailure
    }
  }
}
