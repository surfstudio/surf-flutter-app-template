import 'dart:async';

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

  /// To control parallel token refresh
  Completer<void>? _refreshCompleter;

  @override
  Future<bool> get hasRefreshToken =>
      _authTokensStorage.refreshToken.then((token) => token != null);

  /// Creates an instance of [RefreshTokenRepositoryImpl].
  RefreshTokenRepositoryImpl(
    this._authTokensStorage,
  );

  @override
  Future<void> refreshToken() async {
    /// Wait for existing refresh to complete
    if (_refreshCompleter != null && !_refreshCompleter!.isCompleted) {
      await _refreshCompleter!.future;
      return;
    }

    _refreshCompleter = Completer<void>();

    try {
      final refreshToken = await _authTokensStorage.refreshToken;
      if (refreshToken == null) {
        // ignore: only_throw_errors
        throw RefreshTokenFailure(
          'Refresh token cannot be null on refresh operation',
        );
      }
      // TODO(anyone): authApi.refreshToken and handle token update

      /// Mark the refresh as completed
      _refreshCompleter!.complete();
    } on DioError catch (e) {
      final failure = DioErrorMapper.mapToFailure(e);

      if (failure is RefreshTokenFailure) {
        // TODO(anyone): Log error, handleRefreshTokenFailure
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      // TODO(anyone): Log error, handleRefreshTokenFailure
    } finally {
      /// Clear the completer
      _refreshCompleter = null;
    }
  }
}
