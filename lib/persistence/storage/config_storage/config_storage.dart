/// Persistent storage for config settings.
abstract class IConfigStorage {
  /// Returns proxy url.
  Future<String?> getProxyUrl();

  /// Save proxy url [proxyUrl].
  Future<void> setProxyUrl({required String proxyUrl});

  /// Returns url type.
  Future<String?> getUrlType();

  /// Save url type [urlType].
  Future<void> setUrlType({required String urlType});
}
