// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenPair _$AuthTokenPairFromJson(Map<String, dynamic> json) => AuthTokenPair(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthTokenPairToJson(AuthTokenPair instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
