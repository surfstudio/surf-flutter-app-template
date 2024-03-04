/// {@template tokens_entity.class}
/// Tokens entity
/// {@endtemplate}
final class TokensEntity {
  /// Access-token for accessing server resources for an authorized user.
  final String accessToken;

  /// Refresh-token for updating the access-token.
  final String refreshToken;

  /// {@macro tokens_entity.class}
  const TokensEntity({required this.accessToken, required this.refreshToken});
}
