// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Rafael Ortiz - Software Developer';

  @override
  String get appTitle => 'Rafael Ortiz Zableh - Portfolio';

  @override
  String get developerName => 'Rafael Ortiz Zableh';

  @override
  String get softwareDeveloper => 'Software Developer';

  @override
  String get projects => 'Projects';

  @override
  String get about => 'About';

  @override
  String get contact => 'Contact';

  @override
  String get aboutMe => 'About Me';

  @override
  String get languages => 'Languages';

  @override
  String get english => 'English';

  @override
  String get spanish => 'Spanish';

  @override
  String get italian => 'Italian';

  @override
  String get catalan => 'Catalan';

  @override
  String get closeCta => 'Close';

  @override
  String get fullScreenCta => 'Full Screen';

  @override
  String get previousImageCta => 'Previous Image';

  @override
  String get nextImageCta => 'Next Image';

  @override
  String viewProjectCta(String project) {
    return 'View $project';
  }

  @override
  String get viewMoreDetailsCta => 'More Details';

  @override
  String get toolsAndTechnologies => 'Tools and Technologies';

  @override
  String get joinBuzzProjectDescription =>
      'Lead the technical efforts of pivoting from a video-calling web application for hybrid teams, into a menu bar app for product teams and software developers.\n\nThe requirements included integrating with third party APIs from Github, Google Calendar, Slack, Microsoft, etc.\n\nThe app shows you relevant information about your current workday as well as your teammates\' in real time.\n\nCustom notifications are also shown:\n\n- When you have a meeting coming up, you get a notification that allows you to join with a single click.\n\n- When your pull request has any updates, like comments, review requests, or approvals, you get a notification that allows you to open the pull request.';

  @override
  String get miTransicionProjectDescription =>
      'Designed and developed an app that allows patients of facial feminization to manage all aspects of their medical process, from scheduling appointments, to seeing simulations of their facial changes, paying for their procedure and more.\n\nAdditionally, developed a backoffice for the medical center\'s staff to manage all aspects of the patients\' process, including scheduling appointments, managing payments, and more';

  @override
  String get zurichOneAppProjectDescription =>
      'Built features for the One Zurich App mobile app.\nAmong the challenges faced by my team were:\n\n- Adding support for MSAL through Platform Channels (Swift + Kotlin).\n\n- Adding support for SVG floor plane maps.\n\n- Implementing a custom a Flutter Web backoffice for the app\'s content management system.';

  @override
  String get fundacionSaludSiglo21ProjectDescription =>
      'I was in charge of the techincal aspects of the digitalization process of the Fundación Salud Siglo 21, a non-profit organization that provides medical services to vulnerable communities in Colombia.\n\nThis included:\n\n- Overseeing the non-profit\'s rebranding process.\n\n- Creating a new website for the foundation.\n\n- Creating a full-stack web app that allows users to register, update their information, and pay the yearly membership fees both through physical payments and bank transfers. The app includes integrations with third party APIs for payments, insertion of data into their CRM and Google Sheets, among others.\n\n- Creating a directory web app that allows users to find medical practitioners, filtering by specializations, subspecializations, and medical procedures offered.\n\n- Providing consulting services for the non-profit\'s digitalization process. This included a Social Media and basic design training.';

  @override
  String get profesionalesDeLaSaludProjectDescription =>
      '- Created a website for the medical practice.\n\n- Created a web app for scheduling appointments based on their requirements.\n\n- Created serverless automations for the appointment scheduling process, including integrations with third party APIs.';

  @override
  String get centroMedicoCALProjectDescription =>
      'Oversaw the medical center\'s rebranding process.\n\nCreated a website for the medical center, including a custom section for the medical center\'s directory of medical practitioners.';

  @override
  String get centroUrologicoFoscalProjectDescription =>
      '- Oversaw the medical practice\'s rebranding process.\n\n- Created a website for the medical practice.\n\n- Provided maintenance and support for the medical practice\'s website.\n\n- Provided consulting services for the medical practice\'s digitalization process.\n\n- Provided internal and external communications consulting services for the medical practice.\n\n- Created and implemented a successful SEO strategy for the medical practice.';

  @override
  String get spectMedicinaNuclearProjectDescription =>
      '- Created a website for the medical practice.\n\n- Provided maintenance and support for the medical practice\'s website.\n\n- Created and implemented a successful SEO strategy for the medical practice.';

  @override
  String get elCieloDeMilaProjectDescription =>
      '- Created a website for the non-profit store.\n\n- Provided maintenance and support for the non-profit\'s website.';

  @override
  String get aquaBottlesProjectDescription =>
      '- Created an e-commerce website for the water bottles business.\n- Created serverless automations to record new purchases and abandonded shopping carts on Google Sheets and send notifications on Telegram.\n- Provided maintenance and support for the website.';

  @override
  String get mascootyProjectDescription =>
      'Designed and developed the MVP of a mobile application that allows pet owners to sell and buy pet products and services.';

  @override
  String get allInBikingProjectDescription =>
      'Designed and developed the first iteration of the MVP of a mobile application that allows bike owners to register their bikes, and in case of theft, report it and get help from the community to find it; as well as ride with other bikers.';

  @override
  String get descupAppProjectDescription =>
      'Developed features and fixed bugs for the Descup App mobile app.\nThe app allows users to find better deals for their utilities.';

  @override
  String get ingeoExpertProjectDescription =>
      'Developed features for the e-learning platform\'s mobile app.\n- Created a custom video player that allows users to view videos without using Vimeo.\n- Created a custom PDF viewer that allows users to view PDFs without using Google Drive.\n- Integrated the app with Wordpress and Moodle APIs to allow users to purchase and view courses.\n- Added support for social media login.\n- Improve the app\'s UX/UI design based on requirements.';
}
