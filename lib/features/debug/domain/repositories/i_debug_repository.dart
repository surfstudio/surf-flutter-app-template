import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';
import 'package:flutter_template/features/debug/domain/entities/url_type_entity.dart';

/// Interface for the Debug repository
abstract interface class IDebugRepository {
  /// Returns the current proxy url.
  RequestOperation<String?> getProxyUrl();

  /// Save the current proxy url [proxyUrl].
  RequestOperation<void> setProxyUrl(String proxyUrl);

  /// Returns the current url type
  RequestOperation<UrlTypeEntity?> getUrlType();

  /// Save url type [urlType]
  RequestOperation<void> setUrlType(UrlTypeEntity urlType);
}
