import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_template/api/data/umbrella.dart';
import 'package:flutter_template/api/service/common/common_api.dart';
import 'package:flutter_template/features/common/data/converter/tokens/tokens_entity_converter.dart';
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
  final CommonApi _commonApi;
  final ITokensStorage _tokensStorage;
  final ITokensEntityConverter _tokensEntityConverter;

  /// To control parallel token refresh
  Completer<RequestOperationCompleter<TokensEntity>>? _refreshCompleter;

  /// {@macro refresh_tokens_repository.class}
  RefreshTokensRepository({
    required CommonApi commonApi,
    required ITokensStorage tokensStorage,
    required ITokensEntityConverter tokensEntityConverter,
  })  : _commonApi = commonApi,
        _tokensStorage = tokensStorage,
        _tokensEntityConverter = tokensEntityConverter;

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
      final response = await _commonApi.postRefresh(RefreshTokenData(refreshToken: refreshToken));
      final result = Result.ok(_tokensEntityConverter.convert(response));
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
