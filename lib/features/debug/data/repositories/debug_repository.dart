import 'package:flutter_template/core/architecture/domain/entity/failure.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/core/architecture/domain/entity/result.dart';
import 'package:flutter_template/features/debug/data/converters/url_type_converter.dart';
import 'package:flutter_template/features/debug/domain/entities/url_type_entity.dart';
import 'package:flutter_template/features/debug/domain/repositories/i_debug_repository.dart';
import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';

/// {@template debug_repository.class}
/// Implementation of [IDebugRepository]
/// {@endtemplate}
final class DebugRepository implements IDebugRepository {
  final IConfigStorage _configStorage;
  final IUrlTypeConverter _urlTypeConverter;

  /// {@macro debug_repository.class}
  const DebugRepository({
    required IConfigStorage configStorage,
    required IUrlTypeConverter urlTypeConverter,
  })  : _configStorage = configStorage,
        _urlTypeConverter = urlTypeConverter;

  @override
  RequestOperation<String?> getProxyUrl() async {
    try {
      final proxyUrl = await _configStorage.getProxyUrl();
      return Result.ok(proxyUrl);
    } on Object catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<UrlTypeEntity?> getUrlType() async {
    try {
      final urlType = await _configStorage.getUrlType();

      if (urlType == null) return const ResultOk(null);

      return Result.ok(_urlTypeConverter.convert(urlType));
    } on Object catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<void> setProxyUrl(String proxyUrl) async {
    try {
      await _configStorage.setProxyUrl(proxyUrl: proxyUrl);
      return const ResultOk(null);
    } on Object catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<void> setUrlType(UrlTypeEntity urlType) async {
    try {
      await _configStorage.setUrlType(urlType: _urlTypeConverter.convertReverse(urlType));
      return const ResultOk(null);
    } on Object catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }
}
