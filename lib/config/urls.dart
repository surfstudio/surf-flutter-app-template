import 'package:flutter_template/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// TRest url.
  static String get testUrl => 'http://uinames.com/api/';

  /// Prod url.
  static String get prodUrl => 'https://prod.surfstudio.ru/api';

  /// Dev url.
  static String get devUrl => 'https://localhost:9999/food/hs/ExchangeSotr';

  /// Url for getting IP address.
  static const String ipUrl = 'https://api.ipify.org/';

  /// Base url.
  static String get baseUrl => Environment.instance().config.url;
}
