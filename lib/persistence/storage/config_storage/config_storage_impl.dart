import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for config settings.
///
/// Based on SharedPreferences.
class ConfigSettingsStorageImpl implements IConfigSettingsStorage {
  static const String _proxyKey = 'proxy_url';

  final SharedPreferences _preferences;

  /// Create an instance [ConfigSettingsStorageImpl].
  ConfigSettingsStorageImpl(this._preferences);

  @override
  String? getProxyUrl() {
    return _preferences.getString(_proxyKey);
  }

  @override
  Future<void> setProxyUrl({required String proxy}) async {
    await _preferences.setString(_proxyKey, proxy);
  }
}
