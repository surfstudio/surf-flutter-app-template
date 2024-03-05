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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

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
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
