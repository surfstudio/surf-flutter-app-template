import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/data/repository/api_caller_repository_mixin.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';
import 'package:flutter_template/features/common/domain/entity/tokens/tokens_entity.dart';
import 'package:flutter_template/features/common/domain/repository/refresh_tokens_repository.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/i_tokens_storage.dart';

/// {@template refresh_tokens_repository.class}
/// Implementation RefreshTokensRepository.
/// {@endtemplate}
final class RefreshTokensRepository
    with ApiCallerRepositoryMixin
    implements IRefreshTokensRepository {
  final ITokensStorage _tokensStorage;

  // TODO(anyone): implement
  /// Add an Api for working with authorization tokens
  /// Add a converter for mapping data from the data layer to the domain layer. Use `Converter`.

  /// To control parallel token refresh
  Completer<RequestOperationCompleter<TokensEntity>>? _refreshCompleter;

  /// {@macro refresh_tokens_repository.class}
  RefreshTokensRepository({
    required ITokensStorage tokensStorage,
  }) : _tokensStorage = tokensStorage;

  @override
  RequestOperation<TokensEntity> refreshTokens(String refreshToken) async {
    if (_refreshCompleter != null) {
      final result = await _refreshCompleter!.future;

      switch (result) {
        case ResultOk(:final data):
          return Result.ok(data);
        case ResultFailed(:final failure):
          return Result.failed(failure);
      }
    }

    _refreshCompleter = Completer();

    try {
      // TODO(anyone): implement
      /// 1. Send a request to the API with refreshToken
      /// 2. Convert the received response into domain layer data using a converter.
      const responseMock = TokensEntity(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
      );
      /// 3. Replace the mock result.
      const result = Result.ok(responseMock);
      _refreshCompleter!.complete(result);
      return result;
    } on DioException catch (e, s) {
      final failure = mapApiError(e, trace: s);
      _refreshCompleter!.complete(Result.failed(failure));
      return Result.failed(failure);
    } on Exception catch (e, s) {
      final failure = Failure(original: e, trace: s);
      _refreshCompleter!.complete(Result.failed(failure));
      return Result.failed(failure);
    } finally {
      _refreshCompleter = null;
    }
  }

  @override
  RequestOperation<void> saveTokens(TokensEntity tokens) async {
    try {
      await _tokensStorage.saveAccessToken(tokens.accessToken);
      await _tokensStorage.saveRefreshToken(tokens.refreshToken);

      return const Result.ok(null);
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<String?> getAccessToken() async {
    try {
      final token = await _tokensStorage.accessToken();

      return Result.ok(token);
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<String?> getRefreshToken() async {
    try {
      final token = await _tokensStorage.refreshToken();

      return Result.ok(token);
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }
}
