import 'package:flutter/material.dart';

/// Model for storing tokens in the storage.
@immutable
class AuthTokensStorageDto {
  /// Access-token for accessing server resources for an authorized user.
  final String accessToken;

  /// Refresh-token for updating the access-token.
  final String refreshToken;

  /// Create an instance [AuthTokensStorageDto].
  const AuthTokensStorageDto({
    required this.accessToken,
    required this.refreshToken,
  });
}
