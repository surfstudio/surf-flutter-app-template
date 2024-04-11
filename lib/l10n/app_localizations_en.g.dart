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
  String get debugScreenReloadAppMessage => 'Reload the app to see applied changes';

  @override
  String get uiKitScreenTitle => 'UI Kit';

  @override
  String get uiKitScreenTextFieldLabel => 'Text Field';

  @override
  String get uiKitScreenCardText => 'Card';

  @override
  String get uiKitScreenText => 'Text';

  @override
  String get uiKitScreenPrimaryButtonText => 'Primary Button';

  @override
  String get uiKitScreenPrimaryButtonSnackText => 'Primary Button Pressed';

  @override
  String get uiKitScreenSecondaryButtonText => 'Secondary Button';

  @override
  String get uiKitScreenSecondaryButtonSnackText => 'Secondary Button Pressed';

  @override
  String get uiKitScreenTertiaryButtonText => 'Tertiary Button';

  @override
  String get uiKitScreenTertiaryButtonSnackText => 'Tertiary Button Pressed';

  @override
  String get uiKitScreenTetradicButtonText => 'Tetradic button';

  @override
  String get uiKitScreenTetradicButtonSnackText => 'Tetradic Button Pressed';

  @override
  String get uiKitScreenSnackFromScaffoldMessengerText => 'Snack from ScaffoldMessenger';

  @override
  String get uiKitScreenSnackFromSnackQueueText => 'Snack from Snack Queue';

  @override
  String get uiKitScreenDangerSnackButtonText => 'Danger snack';

  @override
  String get uiKitScreenDangerSnackText => 'Danger snack';

  @override
  String get uiKitScreenPositiveSnackButtonText => 'Positive snack';

  @override
  String get uiKitScreenPositiveSnackText => 'Positive snack';

  @override
  String get uiKitScreenColorCardPrimaryName => 'Primary';

  @override
  String get uiKitScreenColorCardSecondaryName => 'Secondary';

  @override
  String get uiKitScreenColorCardSurfaceName => 'Surface';

  @override
  String get uiKitScreenColorCardSurfaceSecondaryName => 'Surface Secondary';

  @override
  String get uiKitScreenColorCardBackgroundName => 'Background';

  @override
  String get uiKitScreenColorCardBackgroundSecondaryName => 'Background Secondary';

  @override
  String get uiKitScreenColorCardBackgroundTertiaryName => 'Background Tertiary';

  @override
  String get uiKitScreenColorCardBackgroundTetradicName => 'Tetradic Background';

  @override
  String get uiKitScreenColorCardDangerName => 'Danger';

  @override
  String get uiKitScreenColorCardDangerSecondaryName => 'Danger Secondary';

  @override
  String get uiKitScreenColorCardTextFieldName => 'Text Field';

  @override
  String get uiKitScreenColorCardTextFieldLabelName => 'Text Field Label';

  @override
  String get uiKitScreenColorCardTextFieldHelperName => 'Text Field Helper';

  @override
  String get uiKitScreenColorCardFrameTextFieldSecondaryName => 'Frame Text Field Secondary';

  @override
  String get uiKitScreenColorCardInactiveName => 'Inactive';

  @override
  String get uiKitScreenColorCardPositiveName => 'Positive';

  @override
  String get uiKitScreenColorCardSkeletonPrimaryName => 'Skeleton Primary';

  @override
  String get uiKitScreenColorCardSkeletonSecondaryName => 'Skeleton Secondary';

  @override
  String get uiKitScreenColorCardSkeletonTertiaryName => 'Skeleton Tertiary';

  @override
  String get featureExampleFailedLoadIpMessage => 'Failed to load IP address';
}
