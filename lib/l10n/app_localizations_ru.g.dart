import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get positiveResponse => 'Да';

  @override
  String get examplesTitle => 'Примеры';

  @override
  String get examplesLocalizationTitle => 'Примеры локализации';

  @override
  String string(String name) {
    return 'Привет, $name!';
  }

  @override
  String weekDay(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.E(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String dateAndTime(DateTime date, DateTime time) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMMd(localeName);
    final String dateString = dateDateFormat.format(date);
    final intl.DateFormat timeDateFormat = intl.DateFormat.jm(localeName);
    final String timeString = timeDateFormat.format(time);

    return '$dateString, $timeString';
  }

  @override
  String inboxCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'У вас $count новых сообщений',
      one: 'У вас 1 новое ообщение',
      zero: 'У вас нет новых сообщений',
    );
    return '$_temp0';
  }

  @override
  String get tempScreenDashNavBarItemLabel => 'Dash экран';

  @override
  String get tempScreenInfoNavBarItemLabel => 'Инфо экран';

  @override
  String get tempScreenDebugNavBarItemLabel => 'Дебаг экран';

  @override
  String get debugScreenServerSubtitle => 'Сервер';

  @override
  String get debugScreenServerConnectButton => 'Переключить сервер';

  @override
  String get debugScreenProxySubtitle => 'Прокси';

  @override
  String get debugScreenProxyInfo => 'Активирует передачу через прокси сервер.';

  @override
  String get debugScreenProxyEditTextLabel => 'Введите адресс прокси сервера';

  @override
  String get debugScreenProxyConnectButton => 'Подключить';

  @override
  String get debugScreenThemeSubtitle => 'Тема приложения';

  @override
  String get debugScreenThemeLight => 'Светлая тема';

  @override
  String get debugScreenThemeDark => 'Темная темя';

  @override
  String get debugScreenThemeSystem => 'Системная тема';

  @override
  String get debugScreenUikitNavigateButton => 'Открыть UIKit';

  @override
  String get featureExampleFailedLoadIpMessage => 'Не удалось загрузить IP-адрес';
}
