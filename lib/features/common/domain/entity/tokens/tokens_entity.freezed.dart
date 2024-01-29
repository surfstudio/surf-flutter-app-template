// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TokensEntity {
  /// Access-token for accessing server resources for an authorized user.
  String get accessToken => throw _privateConstructorUsedError;

  /// Refresh-token for updating the access-token.
  String get refreshToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokensEntityCopyWith<TokensEntity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensEntityCopyWith<$Res> {
  factory $TokensEntityCopyWith(TokensEntity value, $Res Function(TokensEntity) then) =
      _$TokensEntityCopyWithImpl<$Res, TokensEntity>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$TokensEntityCopyWithImpl<$Res, $Val extends TokensEntity>
    implements $TokensEntityCopyWith<$Res> {
  _$TokensEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokensEntityImplCopyWith<$Res> implements $TokensEntityCopyWith<$Res> {
  factory _$$TokensEntityImplCopyWith(
          _$TokensEntityImpl value, $Res Function(_$TokensEntityImpl) then) =
      __$$TokensEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$TokensEntityImplCopyWithImpl<$Res>
    extends _$TokensEntityCopyWithImpl<$Res, _$TokensEntityImpl>
    implements _$$TokensEntityImplCopyWith<$Res> {
  __$$TokensEntityImplCopyWithImpl(
      _$TokensEntityImpl _value, $Res Function(_$TokensEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$TokensEntityImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TokensEntityImpl implements _TokensEntity {
  const _$TokensEntityImpl({required this.accessToken, required this.refreshToken});

  /// Access-token for accessing server resources for an authorized user.
  @override
  final String accessToken;

  /// Refresh-token for updating the access-token.
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'TokensEntity(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokensEntityImpl &&
            (identical(other.accessToken, accessToken) || other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokensEntityImplCopyWith<_$TokensEntityImpl> get copyWith =>
      __$$TokensEntityImplCopyWithImpl<_$TokensEntityImpl>(this, _$identity);
}

abstract class _TokensEntity implements TokensEntity {
  const factory _TokensEntity(
      {required final String accessToken, required final String refreshToken}) = _$TokensEntityImpl;

  @override

  /// Access-token for accessing server resources for an authorized user.
  String get accessToken;
  @override

  /// Refresh-token for updating the access-token.
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$TokensEntityImplCopyWith<_$TokensEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
