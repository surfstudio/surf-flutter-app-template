import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/api/data/error_data.dart';
import 'package:flutter_template/features/common/domain/entity/failures/api_failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/util/extensions/closures.dart';

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
      final errorData =
          error.response.let((it) => it.data as Map<String, dynamic>?).let(ErrorData.fromJson);

      return ApiFailure(
        statusCode: errorData?.code ?? error.response?.statusCode,
        message: errorData?.detail,
        original: error,
        trace: trace,
      );
    }

    return ApiFailure(
      statusCode: error.response?.statusCode,
      original: error,
      trace: trace,
    );
  }
}
