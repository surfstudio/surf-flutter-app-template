import 'package:dio/dio.dart';
import 'package:flutter_template/features/common/entity/failure/no_internet.dart';

/// The number of retry attempts for sending a request.
const _maxAttempts = 2;

/// The delay between retry attempts.
const _delays = [
  Duration(seconds: 2),
  Duration(seconds: 5),
];

/// Interceptor for retrying a request in case of no internet connection.
class RetryInterceptor extends Interceptor {
  final Dio _dio;

  /// Creates an instance of [RetryInterceptor].
  RetryInterceptor(this._dio);

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.error is NoInternetFailure) {
      bool isRequestCancelled() =>
          err.requestOptions.cancelToken?.isCancelled ?? false;

      final currentAttempt = err.requestOptions._attempt + 1;
      final shouldRetry = currentAttempt <= _maxAttempts;

      if (shouldRetry) {
        err.requestOptions._attempt = currentAttempt;
        final delay = _getDelay(currentAttempt);

        final options = err.requestOptions;

        await Future<void>.delayed(delay);

        if (isRequestCancelled()) return;

        try {
          final result = await _dio.fetch<void>(options);

          handler.resolve(result);
          return;
        } on DioError {
          handler.next(err);
          return;
        }
      }

      handler.next(err);
      return;
    }
    handler.next(err);
  }

  Duration _getDelay(int attempt) {
    return attempt - 1 < _delays.length ? _delays[attempt - 1] : _delays.last;
  }
}

/// Extension for [RequestOptions].
extension RequestOptionsExtention on RequestOptions {
  static const _kAttemptKey = 'attempt_key';

  int get _attempt => (extra[_kAttemptKey] as int?) ?? 0;

  set _attempt(int value) => extra[_kAttemptKey] = value;
}
