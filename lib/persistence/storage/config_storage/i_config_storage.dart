/// Persistent storage for config settings.
abstract class IConfigStorage {
  /// Returns proxy url.
  String? getProxyUrl();

  /// Save proxy url [proxyUrl].
  Future<void> setProxyUrl({String? proxyUrl});

  /// Returns url type.
  String? getUrlType();

  /// Save url type [urlType].
  Future<void> setUrlType({required String urlType});
}
