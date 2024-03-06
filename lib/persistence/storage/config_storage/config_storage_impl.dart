import 'package:flutter_template/persistence/storage/config_storage/i_config_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template config_storage_impl.class}
/// Persistent storage for config settings.
///
/// Based on SharedPreferences.
/// {@endtemplate}
class ConfigStorageImpl implements IConfigStorage {
  final SharedPreferences _prefs;

  /// {@macro config_storage_impl.class}
  const ConfigStorageImpl(this._prefs);

  @override
  String? getProxyUrl() => _prefs.getString(ConfigStorageKeys.proxyUrl.keyString);

  @override
  Future<void> setProxyUrl({String? proxyUrl}) {
    return proxyUrl == null
        ? _prefs.remove(ConfigStorageKeys.proxyUrl.keyString)
        : _prefs.setString(ConfigStorageKeys.proxyUrl.keyString, proxyUrl);
  }

  @override
  String? getUrlType() => _prefs.getString(ConfigStorageKeys.urlType.keyString);

  @override
  Future<void> setUrlType({required String urlType}) {
    return _prefs.setString(ConfigStorageKeys.urlType.keyString, urlType);
  }
}

/// Keys for config settings storage.
enum ConfigStorageKeys {
  /// Proxy url.
  proxyUrl('proxy_url'),

  /// Url type.
  urlType('url_type');

  /// String representation of the key.
  final String keyString;

  const ConfigStorageKeys(this.keyString);
}
