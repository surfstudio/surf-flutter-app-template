/// {@template i_config_settings_storage.class}
/// Persistent storage for config settings.
/// {@endtemplate}
abstract class IConfigSettingsStorage {
  /// Returns proxy url.
  Future<String?> getProxyUrl();

  /// Save proxy url [proxy].
  Future<void> setProxyUrl({required String proxy});
}
