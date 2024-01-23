import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

/// {@template user_profile_entity.class}
/// User profile data
/// {@endtemplate}
@freezed
class UserProfileEntity with _$UserProfileEntity {
  /// {@macro user_profile_entity.class}
  const factory UserProfileEntity({
    /// User's phone number.
    required String phone,

    /// Flag for receiving push notifications.
    required bool shouldReceivePromoActionsInfo,

    /// User identifier.
    required String id,

    /// User's date of birth.
    String? birthday,

    /// User's name.
    String? name,

    /// User's email
    String? email,
  }) = _UserProfileEntity;
}
