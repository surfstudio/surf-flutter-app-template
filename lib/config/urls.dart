import 'package:flutter_template/config/app_config.dart';
import 'package:flutter_template/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// Prod proxy url.
  static String get prodProxyUrl => '';

  /// QA proxy url.
  static String get qaProxyUrl => '192.168.0.1';

  /// Dev proxy url.
  static String get devProxyUrl => '';

  /// TRest url.
  static String get testUrl => 'http://uinames.com/api/';

  /// Prod url.
  static String get prodUrl => 'https://prod.surfstudio.ru/api';

  /// Dev url.
  static String get devUrl => 'https://localhost:9999/food/hs/ExchangeSotr';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
