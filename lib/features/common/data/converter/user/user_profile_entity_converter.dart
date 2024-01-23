import 'package:flutter_template/api/data/user_profile_data.dart';
import 'package:flutter_template/features/common/data/converter/converter.dart';
import 'package:flutter_template/features/common/domain/entity/user/user_profile_entity.dart';

/// Converter for [UserProfileEntity]
typedef IUserProfileEntityConverter = Converter<UserProfileEntity, UserProfileData>;

/// {@template user_profile_entity_converter.class}
/// Implementation [IUserProfileEntityConverter]
/// {@endtemplate}
final class UserProfileEntityConverter extends IUserProfileEntityConverter {
  /// {@macro user_profile_entity_converter.class}
  const UserProfileEntityConverter();

  @override
  UserProfileEntity convert(UserProfileData from) {
    return UserProfileEntity(
      phone: from.phone,
      shouldReceivePromoActionsInfo: from.shouldReceivePromoActionsInfo,
      id: from.id,
      birthday: from.birthday,
      name: from.name,
      email: from.email,
    );
  }
}
