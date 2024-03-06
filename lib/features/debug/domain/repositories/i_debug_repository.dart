import 'package:flutter_template/config/url.dart';
import 'package:flutter_template/core/architecture/domain/entity/request_operation.dart';

/// Interface for the Debug repository.
///
/// The repository is responsible for saving the proxy url and server url.
abstract interface class IDebugRepository {
  /// Save proxy url.
  RequestOperation<void> saveProxyUrl(String? proxyUrl);

  /// Save server url.
  RequestOperation<void> saveServerUrl(Url url);
}
