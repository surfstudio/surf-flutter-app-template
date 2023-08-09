import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/entity/failure/failure.dart';

/// A class that converts [DioError] to [Failure].
abstract class DioErrorMapper {
  /// Converts [DioError] to [Failure].
  static Failure mapToFailure(DioError error, [StackTrace? st]) {
    final dynamic e = error.error;
    if (e is Failure) {
      return e;
    }

    return Failure(
      parentException: error,
      stackTrace: st,
    );
  }
}
