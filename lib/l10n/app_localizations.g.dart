import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.g.dart';
import 'app_localizations_ru.g.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru')];

  /// No description provided for @positiveResponse.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get positiveResponse;

  /// No description provided for @examplesTitle.
  ///
  /// In en, this message translates to:
  /// **'Examples'**
  String get examplesTitle;

  /// No description provided for @examplesLocalizationTitle.
  ///
  /// In en, this message translates to:
  /// **'Localization examples'**
  String get examplesLocalizationTitle;

  /// No description provided for @string.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}!'**
  String string(String name);

  /// No description provided for @weekDay.
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String weekDay(DateTime date);

  /// No description provided for @dateAndTime.
  ///
  /// In en, this message translates to:
  /// **'{date}, {time}'**
  String dateAndTime(DateTime date, DateTime time);

  /// New messages count on the Home screen
  ///
  /// In en, this message translates to:
  /// **'{count, plural, zero{You have no new messages} one{You have 1 new message} other{You have {count} new messages}}'**
  String inboxCount(num count);

  /// No description provided for @tempScreenDashNavBarItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Dash screen'**
  String get tempScreenDashNavBarItemLabel;

  /// No description provided for @tempScreenInfoNavBarItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Info screen'**
  String get tempScreenInfoNavBarItemLabel;

  /// No description provided for @tempScreenDebugNavBarItemLabel.
  ///
  /// In en, this message translates to:
  /// **'Debug screen'**
  String get tempScreenDebugNavBarItemLabel;

  /// No description provided for @debugScreenServerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get debugScreenServerSubtitle;

  /// No description provided for @debugScreenServerConnectButton.
  ///
  /// In en, this message translates to:
  /// **'Change server'**
  String get debugScreenServerConnectButton;

  /// No description provided for @debugScreenProxySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Proxy server'**
  String get debugScreenProxySubtitle;

  /// No description provided for @debugScreenProxyInfo.
  ///
  /// In en, this message translates to:
  /// **'Activates the transfer of traffic through a proxy server.'**
  String get debugScreenProxyInfo;

  /// No description provided for @debugScreenProxyEditTextLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter the proxy server address'**
  String get debugScreenProxyEditTextLabel;

  /// No description provided for @debugScreenProxyConnectButton.
  ///
  /// In en, this message translates to:
  /// **'Connect proxy'**
  String get debugScreenProxyConnectButton;

  /// No description provided for @debugScreenThemeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App theme'**
  String get debugScreenThemeSubtitle;

  /// No description provided for @debugScreenThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get debugScreenThemeLight;

  /// No description provided for @debugScreenThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get debugScreenThemeDark;

  /// No description provided for @debugScreenThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get debugScreenThemeSystem;

  /// No description provided for @debugScreenUikitNavigateButton.
  ///
  /// In en, this message translates to:
  /// **'Open UIKit'**
  String get debugScreenUikitNavigateButton;

  /// No description provided for @debugScreenReloadAppMessage.
  ///
  /// In en, this message translates to:
  /// **'Reload the app to see applied changes'**
  String get debugScreenReloadAppMessage;

  /// No description provided for @uiKitScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'UI Kit'**
  String get uiKitScreenTitle;

  /// No description provided for @uiKitScreenTextFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Text Field'**
  String get uiKitScreenTextFieldLabel;

  /// No description provided for @uiKitScreenCardText.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get uiKitScreenCardText;

  /// No description provided for @uiKitScreenText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get uiKitScreenText;

  /// No description provided for @uiKitScreenPrimaryButtonText.
  ///
  /// In en, this message translates to:
  /// **'Primary Button'**
  String get uiKitScreenPrimaryButtonText;

  /// No description provided for @uiKitScreenPrimaryButtonSnackText.
  ///
  /// In en, this message translates to:
  /// **'Primary Button Pressed'**
  String get uiKitScreenPrimaryButtonSnackText;

  /// No description provided for @uiKitScreenSecondaryButtonText.
  ///
  /// In en, this message translates to:
  /// **'Secondary Button'**
  String get uiKitScreenSecondaryButtonText;

  /// No description provided for @uiKitScreenSecondaryButtonSnackText.
  ///
  /// In en, this message translates to:
  /// **'Secondary Button Pressed'**
  String get uiKitScreenSecondaryButtonSnackText;

  /// No description provided for @uiKitScreenTertiaryButtonText.
  ///
  /// In en, this message translates to:
  /// **'Tertiary Button'**
  String get uiKitScreenTertiaryButtonText;

  /// No description provided for @uiKitScreenTertiaryButtonSnackText.
  ///
  /// In en, this message translates to:
  /// **'Tertiary Button Pressed'**
  String get uiKitScreenTertiaryButtonSnackText;

  /// No description provided for @uiKitScreenTetradicButtonText.
  ///
  /// In en, this message translates to:
  /// **'Tetradic button'**
  String get uiKitScreenTetradicButtonText;

  /// No description provided for @uiKitScreenTetradicButtonSnackText.
  ///
  /// In en, this message translates to:
  /// **'Tetradic Button Pressed'**
  String get uiKitScreenTetradicButtonSnackText;

  /// No description provided for @uiKitScreenSnackFromScaffoldMessengerText.
  ///
  /// In en, this message translates to:
  /// **'Snack from ScaffoldMessenger'**
  String get uiKitScreenSnackFromScaffoldMessengerText;

  /// No description provided for @uiKitScreenSnackFromSnackQueueText.
  ///
  /// In en, this message translates to:
  /// **'Snack from Snack Queue'**
  String get uiKitScreenSnackFromSnackQueueText;

  /// No description provided for @uiKitScreenDangerSnackButtonText.
  ///
  /// In en, this message translates to:
  /// **'Danger snack'**
  String get uiKitScreenDangerSnackButtonText;

  /// No description provided for @uiKitScreenDangerSnackText.
  ///
  /// In en, this message translates to:
  /// **'Danger snack'**
  String get uiKitScreenDangerSnackText;

  /// No description provided for @uiKitScreenPositiveSnackButtonText.
  ///
  /// In en, this message translates to:
  /// **'Positive snack'**
  String get uiKitScreenPositiveSnackButtonText;

  /// No description provided for @uiKitScreenPositiveSnackText.
  ///
  /// In en, this message translates to:
  /// **'Positive snack'**
  String get uiKitScreenPositiveSnackText;

  /// No description provided for @uiKitScreenColorCardPrimaryName.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get uiKitScreenColorCardPrimaryName;

  /// No description provided for @uiKitScreenColorCardSecondaryName.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get uiKitScreenColorCardSecondaryName;

  /// No description provided for @uiKitScreenColorCardSurfaceName.
  ///
  /// In en, this message translates to:
  /// **'Surface'**
  String get uiKitScreenColorCardSurfaceName;

  /// No description provided for @uiKitScreenColorCardSurfaceSecondaryName.
  ///
  /// In en, this message translates to:
  /// **'Surface Secondary'**
  String get uiKitScreenColorCardSurfaceSecondaryName;

  /// No description provided for @uiKitScreenColorCardBackgroundName.
  ///
  /// In en, this message translates to:
  /// **'Background'**
  String get uiKitScreenColorCardBackgroundName;

  /// No description provided for @uiKitScreenColorCardBackgroundSecondaryName.
  ///
  /// In en, this message translates to:
  /// **'Background Secondary'**
  String get uiKitScreenColorCardBackgroundSecondaryName;

  /// No description provided for @uiKitScreenColorCardBackgroundTertiaryName.
  ///
  /// In en, this message translates to:
  /// **'Background Tertiary'**
  String get uiKitScreenColorCardBackgroundTertiaryName;

  /// No description provided for @uiKitScreenColorCardBackgroundTetradicName.
  ///
  /// In en, this message translates to:
  /// **'Tetradic Background'**
  String get uiKitScreenColorCardBackgroundTetradicName;

  /// No description provided for @uiKitScreenColorCardDangerName.
  ///
  /// In en, this message translates to:
  /// **'Danger'**
  String get uiKitScreenColorCardDangerName;

  /// No description provided for @uiKitScreenColorCardDangerSecondaryName.
  ///
  /// In en, this message translates to:
  /// **'Danger Secondary'**
  String get uiKitScreenColorCardDangerSecondaryName;

  /// No description provided for @uiKitScreenColorCardTextFieldName.
  ///
  /// In en, this message translates to:
  /// **'Text Field'**
  String get uiKitScreenColorCardTextFieldName;

  /// No description provided for @uiKitScreenColorCardTextFieldLabelName.
  ///
  /// In en, this message translates to:
  /// **'Text Field Label'**
  String get uiKitScreenColorCardTextFieldLabelName;

  /// No description provided for @uiKitScreenColorCardTextFieldHelperName.
  ///
  /// In en, this message translates to:
  /// **'Text Field Helper'**
  String get uiKitScreenColorCardTextFieldHelperName;

  /// No description provided for @uiKitScreenColorCardFrameTextFieldSecondaryName.
  ///
  /// In en, this message translates to:
  /// **'Frame Text Field Secondary'**
  String get uiKitScreenColorCardFrameTextFieldSecondaryName;

  /// No description provided for @uiKitScreenColorCardInactiveName.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get uiKitScreenColorCardInactiveName;

  /// No description provided for @uiKitScreenColorCardPositiveName.
  ///
  /// In en, this message translates to:
  /// **'Positive'**
  String get uiKitScreenColorCardPositiveName;

  /// No description provided for @uiKitScreenColorCardSkeletonPrimaryName.
  ///
  /// In en, this message translates to:
  /// **'Skeleton Primary'**
  String get uiKitScreenColorCardSkeletonPrimaryName;

  /// No description provided for @uiKitScreenColorCardSkeletonSecondaryName.
  ///
  /// In en, this message translates to:
  /// **'Skeleton Secondary'**
  String get uiKitScreenColorCardSkeletonSecondaryName;

  /// No description provided for @uiKitScreenColorCardSkeletonTertiaryName.
  ///
  /// In en, this message translates to:
  /// **'Skeleton Tertiary'**
  String get uiKitScreenColorCardSkeletonTertiaryName;

  /// No description provided for @featureExampleFailedLoadIpMessage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load IP address'**
  String get featureExampleFailedLoadIpMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError('AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
