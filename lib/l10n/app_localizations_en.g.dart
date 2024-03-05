import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get positiveResponse => 'Yes';

  @override
  String get examplesTitle => 'Examples';

  @override
  String get examplesLocalizationTitle => 'Localization examples';

  @override
  String string(String name) {
    return 'Hello, $name!';
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
      other: 'You have $count new messages',
      one: 'You have 1 new message',
      zero: 'You have no new messages',
    );
    return '$_temp0';
  }

  @override
  String get tempScreenDashNavBarItemLabel => 'Dash screen';

  @override
  String get tempScreenInfoNavBarItemLabel => 'Info screen';

  @override
  String get tempScreenDebugNavBarItemLabel => 'Debug screen';

  @override
  String get debugScreenServerSubtitle => 'Server';

  @override
  String get debugScreenServerConnectButton => 'Change server';

  @override
  String get debugScreenProxySubtitle => 'Proxy server';

  @override
  String get debugScreenProxyInfo => 'Activates the transfer of traffic through a proxy server.';

  @override
  String get debugScreenProxyEditTextLabel => 'Enter the proxy server address';

  @override
  String get debugScreenProxyConnectButton => 'Connect proxy';

  @override
  String get debugScreenThemeSubtitle => 'App theme';

  @override
  String get debugScreenThemeLight => 'Light Theme';

  @override
  String get debugScreenThemeDark => 'Dark Theme';

  @override
  String get debugScreenThemeSystem => 'System Theme';

  @override
  String get debugScreenUikitNavigateButton => 'Open UIKit';

  @override
  String get featureExampleFailedLoadIpMessage => 'Failed to load IP address';
}
