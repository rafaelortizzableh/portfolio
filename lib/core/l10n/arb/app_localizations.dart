import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Rafael Ortiz - Software Developer'**
  String get appName;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Rafael Ortiz Zableh - Portfolio'**
  String get appTitle;

  /// No description provided for @developerName.
  ///
  /// In en, this message translates to:
  /// **'Rafael Ortiz Zableh'**
  String get developerName;

  /// No description provided for @softwareDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Software Developer'**
  String get softwareDeveloper;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @catalan.
  ///
  /// In en, this message translates to:
  /// **'Catalan'**
  String get catalan;

  /// No description provided for @closeCta.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeCta;

  /// No description provided for @fullScreenCta.
  ///
  /// In en, this message translates to:
  /// **'Full Screen'**
  String get fullScreenCta;

  /// No description provided for @previousImageCta.
  ///
  /// In en, this message translates to:
  /// **'Previous Image'**
  String get previousImageCta;

  /// No description provided for @nextImageCta.
  ///
  /// In en, this message translates to:
  /// **'Next Image'**
  String get nextImageCta;

  /// No description provided for @viewProjectCta.
  ///
  /// In en, this message translates to:
  /// **'View {project}'**
  String viewProjectCta(String project);

  /// No description provided for @viewMoreDetailsCta.
  ///
  /// In en, this message translates to:
  /// **'More Details'**
  String get viewMoreDetailsCta;

  /// No description provided for @toolsAndTechnologies.
  ///
  /// In en, this message translates to:
  /// **'Tools and Technologies'**
  String get toolsAndTechnologies;

  /// No description provided for @joinBuzzProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Lead the technical efforts of pivoting from a video-calling web application for hybrid teams, into a menu bar app for product teams and software developers.\n\nThe requirements included integrating with third party APIs from Github, Google Calendar, Slack, Microsoft, etc.\n\nThe app shows you relevant information about your current workday as well as your teammates\' in real time.\n\nCustom notifications are also shown:\n\n- When you have a meeting coming up, you get a notification that allows you to join with a single click.\n\n- When your pull request has any updates, like comments, review requests, or approvals, you get a notification that allows you to open the pull request.'**
  String get joinBuzzProjectDescription;

  /// No description provided for @miTransicionProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Designed and developed an app that allows patients of facial feminization to manage all aspects of their medical process, from scheduling appointments, to seeing simulations of their facial changes, paying for their procedure and more.\n\nAdditionally, developed a backoffice for the medical center\'s staff to manage all aspects of the patients\' process, including scheduling appointments, managing payments, and more'**
  String get miTransicionProjectDescription;

  /// No description provided for @zurichOneAppProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Built features for the One Zurich App mobile app.\nAmong the challenges faced by my team were:\n\n- Adding support for MSAL through Platform Channels (Swift + Kotlin).\n\n- Adding support for SVG floor plane maps.\n\n- Implementing a custom a Flutter Web backoffice for the app\'s content management system.'**
  String get zurichOneAppProjectDescription;

  /// No description provided for @fundacionSaludSiglo21ProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'I was in charge of the techincal aspects of the digitalization process of the Fundación Salud Siglo 21, a non-profit organization that provides medical services to vulnerable communities in Colombia.\n\nThis included:\n\n- Overseeing the non-profit\'s rebranding process.\n\n- Creating a new website for the foundation.\n\n- Creating a full-stack web app that allows users to register, update their information, and pay the yearly membership fees both through physical payments and bank transfers. The app includes integrations with third party APIs for payments, insertion of data into their CRM and Google Sheets, among others.\n\n- Creating a directory web app that allows users to find medical practitioners, filtering by specializations, subspecializations, and medical procedures offered.\n\n- Providing consulting services for the non-profit\'s digitalization process. This included a Social Media and basic design training.'**
  String get fundacionSaludSiglo21ProjectDescription;

  /// No description provided for @profesionalesDeLaSaludProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'- Created a website for the medical practice.\n\n- Created a web app for scheduling appointments based on their requirements.\n\n- Created serverless automations for the appointment scheduling process, including integrations with third party APIs.'**
  String get profesionalesDeLaSaludProjectDescription;

  /// No description provided for @centroMedicoCALProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Oversaw the medical center\'s rebranding process.\n\nCreated a website for the medical center, including a custom section for the medical center\'s directory of medical practitioners.'**
  String get centroMedicoCALProjectDescription;

  /// No description provided for @centroUrologicoFoscalProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'- Oversaw the medical practice\'s rebranding process.\n\n- Created a website for the medical practice.\n\n- Provided maintenance and support for the medical practice\'s website.\n\n- Provided consulting services for the medical practice\'s digitalization process.\n\n- Provided internal and external communications consulting services for the medical practice.\n\n- Created and implemented a successful SEO strategy for the medical practice.'**
  String get centroUrologicoFoscalProjectDescription;

  /// No description provided for @spectMedicinaNuclearProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'- Created a website for the medical practice.\n\n- Provided maintenance and support for the medical practice\'s website.\n\n- Created and implemented a successful SEO strategy for the medical practice.'**
  String get spectMedicinaNuclearProjectDescription;

  /// No description provided for @elCieloDeMilaProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'- Created a website for the non-profit store.\n\n- Provided maintenance and support for the non-profit\'s website.'**
  String get elCieloDeMilaProjectDescription;

  /// No description provided for @aquaBottlesProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'- Created an e-commerce website for the water bottles business.\n- Created serverless automations to record new purchases and abandonded shopping carts on Google Sheets and send notifications on Telegram.\n- Provided maintenance and support for the website.'**
  String get aquaBottlesProjectDescription;

  /// No description provided for @mascootyProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Designed and developed the MVP of a mobile application that allows pet owners to sell and buy pet products and services.'**
  String get mascootyProjectDescription;

  /// No description provided for @allInBikingProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Designed and developed the first iteration of the MVP of a mobile application that allows bike owners to register their bikes, and in case of theft, report it and get help from the community to find it; as well as ride with other bikers.'**
  String get allInBikingProjectDescription;

  /// No description provided for @descupAppProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Developed features and fixed bugs for the Descup App mobile app.\nThe app allows users to find better deals for their utilities.'**
  String get descupAppProjectDescription;

  /// No description provided for @ingeoExpertProjectDescription.
  ///
  /// In en, this message translates to:
  /// **'Developed features for the e-learning platform\'s mobile app.\n- Created a custom video player that allows users to view videos without using Vimeo.\n- Created a custom PDF viewer that allows users to view PDFs without using Google Drive.\n- Integrated the app with Wordpress and Moodle APIs to allow users to purchase and view courses.\n- Added support for social media login.\n- Improve the app\'s UX/UI design based on requirements.'**
  String get ingeoExpertProjectDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
