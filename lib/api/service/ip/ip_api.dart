import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_template/api/service/ip/data/ip_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'ip_api.g.dart';

/// API for ip
@RestApi()
abstract class IpApi {
  /// API creation factory using [Dio].
  factory IpApi(Dio dio) = _IpApi;

  /// Request to obtain the current IP address.
  @GET('/')
  Future<IpDto> getIp();
}
