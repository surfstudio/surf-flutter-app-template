import 'package:flutter_template/persistence/storage/config_storage/i_config_settings_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for config settings.
///
/// Based on SharedPreferences.
class ConfigSettingsStorageImpl implements IConfigSettingsStorage {
  static const _proxyKey = 'proxy_url';
  final SharedPreferences _prefs;

  /// Create an instance [ConfigSettingsStorageImpl].
  const ConfigSettingsStorageImpl(this._prefs);

  @override
  Future<String?> getProxyUrl() async {
    return _prefs.getString(_proxyKey);
  }

  @override
  Future<void> setProxyUrl({required String proxy}) {
    return _prefs.setString(_proxyKey, proxy);
  }
}
