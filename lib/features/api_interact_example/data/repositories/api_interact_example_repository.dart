import 'package:flutter_template/api/service/ip/ip_api.dart';
import 'package:flutter_template/core/architecture/domain/entity/failure.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/api_interact_example/data/converters/ip_converter.dart';
import 'package:flutter_template/features/api_interact_example/domain/entities/ip_entity.dart';
import 'package:flutter_template/features/api_interact_example/domain/repositories/i_api_interact_example_repository.dart';

/// {@template api_interact_example_repository.class}
/// Implementation of [IApiInteractExampleRepository]
/// {@endtemplate}
final class ApiInteractExampleRepository implements IApiInteractExampleRepository {
  final IpApi _ipApi;
  final IIpConverter _ipConverter;

  /// {@macro api_interact_example_repository.class}
  const ApiInteractExampleRepository({
    required IpApi ipApi,
    required IIpConverter ipConverter,
  })  : _ipApi = ipApi,
        _ipConverter = ipConverter;

  @override
  RequestOperation<IpEntity> getIp() async {
    try {
      final result = await _ipApi.getIp();
      return Result.ok(_ipConverter.convert(result));
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }
}
