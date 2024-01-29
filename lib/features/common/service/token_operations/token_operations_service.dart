import 'dart:async';

import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';
import 'package:flutter_template/features/common/domain/entity/tokens/tokens_entity.dart';
import 'package:flutter_template/features/common/domain/repository/refresh_tokens_repository.dart';
import 'package:flutter_template/features/common/service/error_reports/i_error_reports_service.dart';
import 'package:flutter_template/features/common/service/token_operations/i_token_operations_service.dart';

/// {@template token_operations_service.class}
/// Implementation [ITokenOperationsService]
/// {@endtemplate}
class TokenOperationsService implements ITokenOperationsService {
  final IRefreshTokensRepository _refreshTokensRepository;
  final IErrorReportsService _errorReportsService;

  /// {@macro token_operations_service.class}
  TokenOperationsService({
    required IRefreshTokensRepository refreshTokensRepository,
    required IErrorReportsService errorReportsService,
  })  : _refreshTokensRepository = refreshTokensRepository,
        _errorReportsService = errorReportsService;

  @override
  RequestOperation<TokensEntity> refreshTokens(String refreshToken) async {
    final result = await _refreshTokensRepository.refreshTokens(refreshToken);

    switch (result) {
      case ResultOk(:final data):
        return Result.ok(data);
      case ResultFailed(:final failure):
        _errorReportsService.recordFailure(failure);
        return Result.failed(failure);
    }
  }

  @override
  Future<void> saveTokens(TokensEntity tokens) async {
    final result = await _refreshTokensRepository.saveTokens(tokens);

    switch (result) {
      case ResultFailed(:final failure):
        _errorReportsService.recordFailure(failure);
      default:
        return;
    }
  }

  @override
  Future<String?> getAccessToken() async {
    final result = await _refreshTokensRepository.getAccessToken();

    switch (result) {
      case ResultOk(:final data):
        return data;
      case ResultFailed(:final failure):
        _errorReportsService.recordFailure(failure);
        return null;
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    final result = await _refreshTokensRepository.getRefreshToken();

    switch (result) {
      case ResultOk(:final data):
        return data;
      case ResultFailed(:final failure):
        _errorReportsService.recordFailure(failure);
        return null;
    }
  }
}
