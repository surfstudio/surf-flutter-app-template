import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_template/api/data/refresh_token_data.dart';
import 'package:flutter_template/api/data/tokens_data.dart';
import 'package:flutter_template/api/service/common/common_api.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';
import 'package:flutter_template/features/common/service/error_reports/i_error_reports_service.dart';
import 'package:flutter_template/features/common/service/token_operations/i_token_operations_service.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/i_tokens_storage.dart';

/// {@template token_operations_dio_service.class}
/// Implementation [ITokenOperationsService]
/// {@endtemplate}
class TokenOperationsDioService implements ITokenOperationsService<TokensData, DioException> {
  final CommonApi _commonApi;
  final ITokensStorage _tokensStorage;
  final IErrorReportsService _errorReportsService;

  /// {@macro token_operations_dio_service.class}
  TokenOperationsDioService({
    required CommonApi commonApi,
    required ITokensStorage tokensStorage,
    required IErrorReportsService errorReportsService,
  })  : _commonApi = commonApi,
        _tokensStorage = tokensStorage,
        _errorReportsService = errorReportsService;

  @override
  Future<Result<TokensData, Failure<DioException>>> refreshTokens(String refreshToken) async {
    try {
      final tokensData = await _commonApi.postRefresh(RefreshTokenData(refreshToken: refreshToken));
      return Result.ok(tokensData);
    } on DioException catch (e, s) {
      _errorReportsService.recordError(e, trace: s);
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  Future<void> saveTokens(TokensData tokens) async {
    await _tokensStorage.saveAccessToken(tokens.accessToken);
    await _tokensStorage.saveRefreshToken(tokens.refreshToken);
  }

  @override
  Future<String?> getAccessToken() => _tokensStorage.accessToken();

  @override
  Future<String?> getRefreshToken() => _tokensStorage.refreshToken();
}
