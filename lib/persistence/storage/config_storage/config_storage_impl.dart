import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for config settings.
///
/// Based on SharedPreferences.
class ConfigSettingsStorageImpl implements IConfigSettingsStorage {
  static const String _proxyKey = 'proxy_url';
  final SharedPreferences _prefs;

  /// Create an instance [ConfigSettingsStorageImpl].
  ConfigSettingsStorageImpl(this._prefs);

  @override
  Future<String?> getProxyUrl() async {
    return _prefs.getString(_proxyKey);
  }

  @override
  Future<void> setProxyUrl({required String proxy}) async {
    await _prefs.setString(_proxyKey, proxy);
  }
}
