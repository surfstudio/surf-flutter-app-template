import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';
import 'package:flutter_template/features/common/service/error_reports/i_error_reports_service.dart';
import 'package:flutter_template/features/common/service/token_operations/i_token_operations_service.dart';

/// Authorization error status code.
const unauthorisedStatusCode = 401;

/// {@template auth_interceptor.class}
/// Interceptor for requests requiring authorization.
/// {@endtemplate}
final class AuthInterceptor extends QueuedInterceptorsWrapper {
  final Dio _dio;
  final ITokenOperationsService _tokenOperationsService;
  final IErrorReportsService _errorReportsService;
  final AsyncCallback _onLogout;

  /// {@macro auth_interceptor.class}
  AuthInterceptor({
    required Dio dio,
    required ITokenOperationsService tokenOperationsService,
    required IErrorReportsService errorReportsService,
    required AsyncCallback onLogout,
  })  : _dio = dio,
        _tokenOperationsService = tokenOperationsService,
        _errorReportsService = errorReportsService,
        _onLogout = onLogout;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _tokenOperationsService.getAccessToken();

    if (accessToken == null) {
      return handler.reject(DioException(requestOptions: options));
    }

    return super.onRequest(
      options..addAuthHeader(accessToken),
      handler,
    );
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != unauthorisedStatusCode) {
      return super.onError(err, handler);
    }

    final refreshToken = await _tokenOperationsService.getRefreshToken();
    if (refreshToken == null) {
      return super.onError(err, handler);
    }

    final tokensResult = await _tokenOperationsService.refreshTokens(refreshToken);

    switch (tokensResult) {
      case ResultOk(data: final tokens):
        await _tokenOperationsService.saveTokens(tokens);

        final retryResult =
            await _retryRequest(err.requestOptions..addAuthHeader(tokens.accessToken));

        switch (retryResult) {
          case ResultOk(data: final response):
            return handler.resolve(response);
          case ResultFailed(:final failure):
            return super.onError(failure.original, handler);
        }
      case ResultFailed(:final failure):
        await _onLogout();
        final originalException = failure.original;
        final dioException = originalException is DioException ? originalException : null;
        return dioException != null ? handler.reject(dioException) : null;
    }
  }

  // ignore: avoid-dynamic
  Future<Result<Response<dynamic>, Failure<DioException>>> _retryRequest(
      RequestOptions requestOptions) async {
    try {
      final response = await _dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        cancelToken: requestOptions.cancelToken,
        options: requestOptions.toOptions(),
        onReceiveProgress: requestOptions.onReceiveProgress,
        onSendProgress: requestOptions.onSendProgress,
      );

      return Result.ok(response);
    } on DioException catch (e, s) {
      _errorReportsService.recordError(e, trace: s);
      return Result.failed(Failure(original: e, trace: s));
    }
  }
}

extension on RequestOptions {
  void addAuthHeader(String accessToken) {
    headers.addAll({'Authorization': 'Bearer $accessToken'});
  }

  Options toOptions() => Options(
        method: method,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
        extra: extra,
        headers: headers,
        responseType: responseType,
        contentType: contentType,
        validateStatus: validateStatus,
        receiveDataWhenStatusError: receiveDataWhenStatusError,
        followRedirects: followRedirects,
        maxRedirects: maxRedirects,
        requestEncoder: requestEncoder,
        responseDecoder: responseDecoder,
        listFormat: listFormat,
      );
}
