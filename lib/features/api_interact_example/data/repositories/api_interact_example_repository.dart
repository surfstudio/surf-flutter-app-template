import 'package:flutter_template/api/service/ip/ip_api.dart';
import 'package:flutter_template/features/api_interact_example/domain/entities/ip_entity.dart';
import 'package:flutter_template/features/api_interact_example/domain/repositories/i_api_interact_example_repository.dart';

/// {@template api_interact_example_repository.class}
/// Implementation of [IApiInteractExampleRepository]
/// {@endtemplate}
final class ApiInteractExampleRepository implements IApiInteractExampleRepository {
  final IpApi _ipApi;

  /// {@macro api_interact_example_repository.class}
  const ApiInteractExampleRepository({
    required IpApi ipApi,
  }) : _ipApi = ipApi;

  @override
  RequestOperation<IpEntity> getIp() {
    try {
      final result = await _menuApi.getOrganizationIdMenuCategories(organizationId);
      return Result.ok(_categoryConverter.convertMultiple(result).toList());
    } on DioError catch (e, s) {
      return Result.failed(mapApiError(e, trace: s));
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }



}
