// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileEntity {
  /// User's phone number.
  String get phone => throw _privateConstructorUsedError;

  /// Flag for receiving push notifications.
  bool get shouldReceivePromoActionsInfo => throw _privateConstructorUsedError;

  /// User identifier.
  String get id => throw _privateConstructorUsedError;

  /// User's date of birth.
  String? get birthday => throw _privateConstructorUsedError;

  /// User's name.
  String? get name => throw _privateConstructorUsedError;

  /// User's email
  String? get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileEntityCopyWith<UserProfileEntity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileEntityCopyWith<$Res> {
  factory $UserProfileEntityCopyWith(
          UserProfileEntity value, $Res Function(UserProfileEntity) then) =
      _$UserProfileEntityCopyWithImpl<$Res, UserProfileEntity>;
  @useResult
  $Res call(
      {String phone,
      bool shouldReceivePromoActionsInfo,
      String id,
      String? birthday,
      String? name,
      String? email});
}

/// @nodoc
class _$UserProfileEntityCopyWithImpl<$Res, $Val extends UserProfileEntity>
    implements $UserProfileEntityCopyWith<$Res> {
  _$UserProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? shouldReceivePromoActionsInfo = null,
    Object? id = null,
    Object? birthday = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      shouldReceivePromoActionsInfo: null == shouldReceivePromoActionsInfo
          ? _value.shouldReceivePromoActionsInfo
          : shouldReceivePromoActionsInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileEntityImplCopyWith<$Res> implements $UserProfileEntityCopyWith<$Res> {
  factory _$$UserProfileEntityImplCopyWith(
          _$UserProfileEntityImpl value, $Res Function(_$UserProfileEntityImpl) then) =
      __$$UserProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phone,
      bool shouldReceivePromoActionsInfo,
      String id,
      String? birthday,
      String? name,
      String? email});
}

/// @nodoc
class __$$UserProfileEntityImplCopyWithImpl<$Res>
    extends _$UserProfileEntityCopyWithImpl<$Res, _$UserProfileEntityImpl>
    implements _$$UserProfileEntityImplCopyWith<$Res> {
  __$$UserProfileEntityImplCopyWithImpl(
      _$UserProfileEntityImpl _value, $Res Function(_$UserProfileEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? shouldReceivePromoActionsInfo = null,
    Object? id = null,
    Object? birthday = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_$UserProfileEntityImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      shouldReceivePromoActionsInfo: null == shouldReceivePromoActionsInfo
          ? _value.shouldReceivePromoActionsInfo
          : shouldReceivePromoActionsInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserProfileEntityImpl implements _UserProfileEntity {
  const _$UserProfileEntityImpl(
      {required this.phone,
      required this.shouldReceivePromoActionsInfo,
      required this.id,
      this.birthday,
      this.name,
      this.email});

  /// User's phone number.
  @override
  final String phone;

  /// Flag for receiving push notifications.
  @override
  final bool shouldReceivePromoActionsInfo;

  /// User identifier.
  @override
  final String id;

  /// User's date of birth.
  @override
  final String? birthday;

  /// User's name.
  @override
  final String? name;

  /// User's email
  @override
  final String? email;

  @override
  String toString() {
    return 'UserProfileEntity(phone: $phone, shouldReceivePromoActionsInfo: $shouldReceivePromoActionsInfo, id: $id, birthday: $birthday, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileEntityImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.shouldReceivePromoActionsInfo, shouldReceivePromoActionsInfo) ||
                other.shouldReceivePromoActionsInfo == shouldReceivePromoActionsInfo) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.birthday, birthday) || other.birthday == birthday) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phone, shouldReceivePromoActionsInfo, id, birthday, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileEntityImplCopyWith<_$UserProfileEntityImpl> get copyWith =>
      __$$UserProfileEntityImplCopyWithImpl<_$UserProfileEntityImpl>(this, _$identity);
}

abstract class _UserProfileEntity implements UserProfileEntity {
  const factory _UserProfileEntity(
      {required final String phone,
      required final bool shouldReceivePromoActionsInfo,
      required final String id,
      final String? birthday,
      final String? name,
      final String? email}) = _$UserProfileEntityImpl;

  @override

  /// User's phone number.
  String get phone;
  @override

  /// Flag for receiving push notifications.
  bool get shouldReceivePromoActionsInfo;
  @override

  /// User identifier.
  String get id;
  @override

  /// User's date of birth.
  String? get birthday;
  @override

  /// User's name.
  String? get name;
  @override

  /// User's email
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileEntityImplCopyWith<_$UserProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
