import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_template/api/data/umbrella.dart';
import 'package:flutter_template/api/service/user/user_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

/// UserApi gateway
@RestApi()
abstract class UserApi {
  /// Creates UserApi gateway
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  /// Получение профиля пользователя
  @GET(UserUrls.profile)
  Future<UserProfileData> getProfile();
}
