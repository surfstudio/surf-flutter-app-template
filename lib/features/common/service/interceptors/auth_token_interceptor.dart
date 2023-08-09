import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/persistence/storage/auth_tokens/auth_tokens_storage.dart';

/// Dio-interceptor for adding an authorization token to requests.
class AuthTokenInterceptor extends Interceptor {
  final IAuthTokensStorage _authTokensStorage;

  /// Creates an instance of [AuthTokenInterceptor].
  AuthTokenInterceptor(this._authTokensStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authToken = await _authTokensStorage.accessToken;
    if (authToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $authToken';
    }

    handler.next(options);
  }
}
