import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';

/// Interface for the Debug repository
abstract interface class IDebugRepository {
  /// Save the current proxy url [proxyUrl].
  RequestOperation<void> saveProxyUrl(String proxyUrl);

  /// Save url type [url]
  RequestOperation<void> saveServerUrl(Url url);
}
