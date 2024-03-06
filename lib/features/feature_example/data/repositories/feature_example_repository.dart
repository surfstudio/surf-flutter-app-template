import 'package:dio/dio.dart';
import 'package:flutter_template/api/service/ip/ip_api.dart';
import 'package:flutter_template/core/architecture/domain/entity/failure.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/feature_example/data/converters/ip_converter.dart';
import 'package:flutter_template/features/feature_example/domain/entities/ip_entity.dart';
import 'package:flutter_template/features/feature_example/domain/repositories/i_feature_example_repository.dart';

/// {@template feature_example_repository.class}
/// Implementation of [IFeatureExampleRepository].
/// {@endtemplate}
final class FeatureExampleRepository implements IFeatureExampleRepository {
  final IpApi _ipApi;
  final IIpConverter _ipConverter;

  /// {@macro feature_example_repository.class}
  const FeatureExampleRepository({
    required IpApi ipApi,
    required IIpConverter ipConverter,
  })  : _ipApi = ipApi,
        _ipConverter = ipConverter;

  @override
  RequestOperation<IpEntity> getIp() async {
    try {
      final result = await _ipApi.getIp();

      return Result.ok(_ipConverter.convert(result));
    } on DioException catch (error, s) {
      return Result.failed(Failure(original: error, trace: s));
      // ignore: avoid-identical-exception-handling-blocks
    } on Object catch (error, s) {
      return Result.failed(Failure(original: error, trace: s));
    }
  }
}
