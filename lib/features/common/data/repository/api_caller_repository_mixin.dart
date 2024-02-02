import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/domain/entity/failures/api_failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';

/// Mixin for all repositories that make API calls.
/// Serves for error mapping.
base mixin ApiCallerRepositoryMixin {
  /// API error mapping.
  Failure mapApiError(DioException error, {required StackTrace trace}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.unknown when error.error is SocketException:
        return TimeoutFailure(
          statusCode: error.response?.statusCode,
          original: error,
          trace: trace,
        );
      default:
        break;
    }

    if (error.response?.statusCode == 500) {
      // TODO(anyone): implement
      /*
      If an internal server error occurred and the server returns a custom error
      in the form of an object, for example
      {
      "code": 102,
      "detail": "This is a description of an error.",
      }, then it is necessary to perform mapping and return

      ApiFailure(
        statusCode: ...,
        message: ...,
        original: error,
        trace: trace,
      )
     */
    }

    return ApiFailure(
      statusCode: error.response?.statusCode,
      original: error,
      trace: trace,
    );
  }
}
