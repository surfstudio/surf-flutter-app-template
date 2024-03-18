// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ip_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IpEntity {
  /// IP address.
  String get ip => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IpEntityCopyWith<IpEntity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpEntityCopyWith<$Res> {
  factory $IpEntityCopyWith(IpEntity value, $Res Function(IpEntity) then) = _$IpEntityCopyWithImpl<$Res, IpEntity>;
  @useResult
  $Res call({String ip});
}

/// @nodoc
class _$IpEntityCopyWithImpl<$Res, $Val extends IpEntity> implements $IpEntityCopyWith<$Res> {
  _$IpEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
  }) {
    return _then(_value.copyWith(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IpEntityImplCopyWith<$Res> implements $IpEntityCopyWith<$Res> {
  factory _$$IpEntityImplCopyWith(_$IpEntityImpl value, $Res Function(_$IpEntityImpl) then) =
      __$$IpEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ip});
}

/// @nodoc
class __$$IpEntityImplCopyWithImpl<$Res> extends _$IpEntityCopyWithImpl<$Res, _$IpEntityImpl>
    implements _$$IpEntityImplCopyWith<$Res> {
  __$$IpEntityImplCopyWithImpl(_$IpEntityImpl _value, $Res Function(_$IpEntityImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
  }) {
    return _then(_$IpEntityImpl(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IpEntityImpl implements _IpEntity {
  const _$IpEntityImpl({required this.ip});

  /// IP address.
  @override
  final String ip;

  @override
  String toString() {
    return 'IpEntity(ip: $ip)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IpEntityImpl && (identical(other.ip, ip) || other.ip == ip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IpEntityImplCopyWith<_$IpEntityImpl> get copyWith =>
      __$$IpEntityImplCopyWithImpl<_$IpEntityImpl>(this, _$identity);
}

abstract class _IpEntity implements IpEntity {
  const factory _IpEntity({required final String ip}) = _$IpEntityImpl;

  @override

  /// IP address.
  String get ip;
  @override
  @JsonKey(ignore: true)
  _$$IpEntityImplCopyWith<_$IpEntityImpl> get copyWith => throw _privateConstructorUsedError;
}
