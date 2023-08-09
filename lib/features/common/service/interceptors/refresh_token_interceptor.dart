import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/entity/failure/server/unauthorized_failure.dart';
import 'package:flutter_template/features/common/service/repository/refresh_token/refresh_token_repository.dart';

/// Interceptor for token refresh operations.
class RefreshTokenInterceptor extends Interceptor {
  final Dio _dio;
  final IRefreshTokenRepository _refreshTokenRepository;

  /// Creates an instance of [RefreshTokenInterceptor].
  RefreshTokenInterceptor(
    this._refreshTokenRepository,
    this._dio,
  );

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final error = err.error;

    if (error is UnauthorizedFailure) {
      /// Check if we even have a refresh token.
      final hasToken = await _refreshTokenRepository.hasRefreshToken;

      if (!hasToken) {
        handler.next(err);
        return;
      }

      /// Attempt to refresh the token upon an authorization error.
      await _refreshTokenRepository.refreshToken();

      final options = err.requestOptions;

      /// After which, if successful, proceed with the initial request.
      final result = await _dio.request<dynamic>(
        options.path,
        options: Options(
          method: options.method,
          sendTimeout: options.sendTimeout,
          receiveTimeout: options.receiveTimeout,
          extra: options.extra,
          headers: options.headers,
          responseType: options.responseType,
          contentType: options.contentType,
          validateStatus: options.validateStatus,
          receiveDataWhenStatusError: options.receiveDataWhenStatusError,
          followRedirects: options.followRedirects,
          maxRedirects: options.maxRedirects,
          requestEncoder: options.requestEncoder,
          responseDecoder: options.responseDecoder,
          listFormat: options.listFormat,
        ),
        data: options.data,
        queryParameters: options.queryParameters,
        cancelToken: options.cancelToken,
        onSendProgress: options.onSendProgress,
        onReceiveProgress: options.onReceiveProgress,
      );

      handler.resolve(result);
      return;
    }

    handler.next(err);
  }
}
