import 'package:flutter_template/persistence/storage/config_storage/i_config_settings_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template config_settings_storage.class}
/// Persistent storage for config settings.
///
/// Based on SharedPreferences.
/// {@endtemplate}
class ConfigSettingsStorage implements IConfigSettingsStorage {
  final SharedPreferences _prefs;

  /// Create an instance [ConfigSettingsStorage].
  /// {@macro config_settings_storage.class}
  const ConfigSettingsStorage(this._prefs);

  @override
  Future<String?> getProxyUrl() async {
    return _prefs.getString(ConfigSettingsStorageKeys.proxyUrl.keyName);
  }

  @override
  Future<void> setProxyUrl({required String proxy}) =>
      _prefs.setString(ConfigSettingsStorageKeys.proxyUrl.keyName, proxy);
}

/// Keys for [ConfigSettingsStorage].
enum ConfigSettingsStorageKeys {
  /// @nodoc.
  proxyUrl('proxy_url');

  /// Key Name.
  final String keyName;

  const ConfigSettingsStorageKeys(this.keyName);
}
