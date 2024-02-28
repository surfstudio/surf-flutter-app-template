import 'package:flutter_template/persistence/storage/config_storage/config_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persistent storage for config settings.
///
/// Based on SharedPreferences.
class ConfigStorageImpl implements IConfigStorage {
  final SharedPreferences _prefs;

  /// Create an instance [ConfigStorageImpl].
  const ConfigStorageImpl(this._prefs);

  @override
  Future<String?> getProxyUrl() async {
    return _prefs.getString(ConfigStorageKeys.proxyUrl.keyString);
  }

  @override
  Future<void> setProxyUrl({required String proxyUrl}) async {
    await _prefs.setString(ConfigStorageKeys.proxyUrl.keyString, proxyUrl);
  }

  @override
  Future<String?> getUrlType() async {
    return _prefs.getString(ConfigStorageKeys.urlType.keyString);
  }

  @override
  Future<void> setUrlType({required String urlType}) {
    return _prefs.setString(ConfigStorageKeys.urlType.keyString, urlType);
  }
}

/// Keys for config settings storage
enum ConfigStorageKeys {
  /// Proxy url
  proxyUrl('proxy_url'),

  /// Url type
  urlType('url_type');

  /// String representation of the key
  final String keyString;

  const ConfigStorageKeys(this.keyString);
}
