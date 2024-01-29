// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_entity.freezed.dart';

/// {@template tokens_entity.class}
/// Tokens entity
/// {@endtemplate}
@freezed
class TokensEntity with _$TokensEntity {
  /// {@macro tokens_entity.class}
  const factory TokensEntity({
    /// Access-token for accessing server resources for an authorized user.
    required String accessToken,

    /// Refresh-token for updating the access-token.
    required String refreshToken,
  }) = _TokensEntity;
}
