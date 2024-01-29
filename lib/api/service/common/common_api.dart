import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_template/api/data/umbrella.dart';
import 'package:flutter_template/api/service/common/common_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'common_api.g.dart';

/// CommonApi gateway
@RestApi()
abstract class CommonApi {
  /// Creates CommonApi gateway
  factory CommonApi(Dio dio, {String baseUrl}) = _CommonApi;

  /// Logout from the account.
  @POST(CommonUrls.logout)
  Future<void> postLogout();

  /// Tokens update.
  @POST(CommonUrls.refresh)
  Future<TokensData> postRefresh(
    @Body() RefreshTokenData refreshToken,
  );
}
