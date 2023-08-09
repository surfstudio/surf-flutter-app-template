import 'package:flutter/material.dart';

/// A model for storing tokens in storage.
@immutable
class AuthTokensStorageDto {
  /// Access token.
  final String accessToken;

  /// Refresh token.
  final String refreshToken;

  /// Expiration date of the access token.
  final DateTime expiresAt;

  /// Create a token model.
  const AuthTokensStorageDto({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}
