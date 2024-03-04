import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';

/// Interface for the Debug repository
abstract interface class IDebugRepository {
  /// Returns the current proxy url.
  RequestOperation<String?> proxyUrl();

  /// Save the current proxy url [proxyUrl].
  RequestOperation<void> saveProxyUrl(String proxyUrl);

  /// Returns the current url type
  RequestOperation<Url?> url();

  /// Save url type [url]
  RequestOperation<void> saveUrl(Url url);
}
