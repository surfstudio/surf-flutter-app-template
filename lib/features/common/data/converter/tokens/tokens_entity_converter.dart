import 'package:flutter_template/api/data/tokens_data.dart';
import 'package:flutter_template/features/common/data/converter/converter.dart';
import 'package:flutter_template/features/common/domain/entity/tokens/tokens_entity.dart';

/// Converter for [TokensEntity]
typedef ITokensEntityConverter = Converter<TokensEntity, TokensData>;

/// {@template tokens_entity_converter.class}
/// Implementation [ITokensEntityConverter]
/// {@endtemplate}
final class TokensEntityConverter extends ITokensEntityConverter {
  /// {@macro tokens_entity_converter.class}
  const TokensEntityConverter();

  @override
  TokensEntity convert(TokensData from) {
    return TokensEntity(
      accessToken: from.accessToken,
      refreshToken: from.refreshToken,
    );
  }
}
