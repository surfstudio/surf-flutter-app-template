import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/api/service/common/data/server_error_response.dart';
import 'package:flutter_template/features/common/entity/failure/no_internet.dart';
import 'package:flutter_template/features/common/entity/failure/server/not_responding.dart';
import 'package:flutter_template/features/common/entity/failure/server/refresh_token.dart';
import 'package:flutter_template/features/common/entity/failure/server/server.dart';
import 'package:flutter_template/features/common/entity/failure/server/server_internal_failure.dart';
import 'package:flutter_template/features/common/entity/failure/server/unauthorized_failure.dart';

/// Dio interceptor for server-side errors.
class ServerErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw ServerNotResponsingFailure();
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.connectionError:
      case DioErrorType.unknown:
        if (err.error is SocketException) {
          throw NoInternetFailure();
        }

        throw ServerNotResponsingFailure();
      case DioErrorType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode == 401) {
          throw UnauthorizedFailure();
        }
        if (statusCode == 500) {
          throw ServerInternalFailure();
        }

        _maybeHandleErrorWithResponse(err);

        throw ServerNotResponsingFailure();
    }
  }

  void _maybeHandleErrorWithResponse(DioError err) {
    final Object? serverErrorResponse = err.response?.data;
    late final ServerErrorResponse parsedServerResponse;

    if (serverErrorResponse is Map<String, Object?>) {
      parsedServerResponse = ServerErrorResponse.fromJson(serverErrorResponse);
    } else {
      return;
    }

    switch (parsedServerResponse.type) {
      case RefreshTokenFailure.associatedCode:
        throw RefreshTokenFailure(parsedServerResponse.title);
      default:
        throw const ServerFailure();
    }
  }
}
