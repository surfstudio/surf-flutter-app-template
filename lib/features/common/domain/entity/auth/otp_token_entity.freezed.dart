// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpTokenEntity {
  /// Authorization code lifetime in seconds
  Duration get codeLifetime => throw _privateConstructorUsedError;

  /// OTP token for user authentication
  String get otpToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpTokenEntityCopyWith<OtpTokenEntity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpTokenEntityCopyWith<$Res> {
  factory $OtpTokenEntityCopyWith(OtpTokenEntity value, $Res Function(OtpTokenEntity) then) =
      _$OtpTokenEntityCopyWithImpl<$Res, OtpTokenEntity>;
  @useResult
  $Res call({Duration codeLifetime, String otpToken});
}

/// @nodoc
class _$OtpTokenEntityCopyWithImpl<$Res, $Val extends OtpTokenEntity>
    implements $OtpTokenEntityCopyWith<$Res> {
  _$OtpTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeLifetime = null,
    Object? otpToken = null,
  }) {
    return _then(_value.copyWith(
      codeLifetime: null == codeLifetime
          ? _value.codeLifetime
          : codeLifetime // ignore: cast_nullable_to_non_nullable
              as Duration,
      otpToken: null == otpToken
          ? _value.otpToken
          : otpToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtpTokenEntityImplCopyWith<$Res> implements $OtpTokenEntityCopyWith<$Res> {
  factory _$$OtpTokenEntityImplCopyWith(
          _$OtpTokenEntityImpl value, $Res Function(_$OtpTokenEntityImpl) then) =
      __$$OtpTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration codeLifetime, String otpToken});
}

/// @nodoc
class __$$OtpTokenEntityImplCopyWithImpl<$Res>
    extends _$OtpTokenEntityCopyWithImpl<$Res, _$OtpTokenEntityImpl>
    implements _$$OtpTokenEntityImplCopyWith<$Res> {
  __$$OtpTokenEntityImplCopyWithImpl(
      _$OtpTokenEntityImpl _value, $Res Function(_$OtpTokenEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codeLifetime = null,
    Object? otpToken = null,
  }) {
    return _then(_$OtpTokenEntityImpl(
      codeLifetime: null == codeLifetime
          ? _value.codeLifetime
          : codeLifetime // ignore: cast_nullable_to_non_nullable
              as Duration,
      otpToken: null == otpToken
          ? _value.otpToken
          : otpToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtpTokenEntityImpl implements _OtpTokenEntity {
  const _$OtpTokenEntityImpl({required this.codeLifetime, required this.otpToken});

  /// Authorization code lifetime in seconds
  @override
  final Duration codeLifetime;

  /// OTP token for user authentication
  @override
  final String otpToken;

  @override
  String toString() {
    return 'OtpTokenEntity(codeLifetime: $codeLifetime, otpToken: $otpToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpTokenEntityImpl &&
            (identical(other.codeLifetime, codeLifetime) || other.codeLifetime == codeLifetime) &&
            (identical(other.otpToken, otpToken) || other.otpToken == otpToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, codeLifetime, otpToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpTokenEntityImplCopyWith<_$OtpTokenEntityImpl> get copyWith =>
      __$$OtpTokenEntityImplCopyWithImpl<_$OtpTokenEntityImpl>(this, _$identity);
}

abstract class _OtpTokenEntity implements OtpTokenEntity {
  const factory _OtpTokenEntity(
      {required final Duration codeLifetime,
      required final String otpToken}) = _$OtpTokenEntityImpl;

  @override

  /// Authorization code lifetime in seconds
  Duration get codeLifetime;
  @override

  /// OTP token for user authentication
  String get otpToken;
  @override
  @JsonKey(ignore: true)
  _$$OtpTokenEntityImplCopyWith<_$OtpTokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
