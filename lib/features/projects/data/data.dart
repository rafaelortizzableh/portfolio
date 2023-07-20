import '../../features.dart';

abstract class PortfolioProjects {
  static final _buzz = PortfolioProject(
    title: 'Join Buzz',
    description:
        'Lead the technical efforts of pivoting from a video-calling web application for hybrid teams, into a menu bar app for product teams and software developers.\n'
        'The requirements included integrating with third party APIs from Github, Google Calendar, Slack, Microsoft, etc.\n'
        'The app shows you relevant information about your current workday as well as your teammates\' in real time.\n\n'
        'Custom notifications are also shown:\n'
        '- When you have a meeting coming up, you get a notification that allows you to join with a single click.\n'
        '- When your pull request has any updates, like comments, review requests, or approvals, you get a notification that allows you to open the pull request.\n',
    techTools: {
      TechTool.nodeJS,
      TechTool.flutter,
      TechTool.go,
      TechTool.serverpod,
      TechTool.postgres,
      TechTool.redis,
      TechTool.docker,
      TechTool.aws,
    },
    imageLogoAssetPath: 'assets/logos/buzz_logo.webp',
    website: Uri.parse('https://joinbuzz.com'),
    youtubeDemoUrl: Uri.parse('https://youtu.be/qxeiH9ml9nM'),
    featuredImageAssetPath: 'assets/images/buzz_0.webp',
    imageAssetPaths: [
      'assets/images/buzz_0.webp',
      'assets/images/buzz_1.webp',
      'assets/images/buzz_2.webp',
      'assets/images/buzz_3.webp',
      'assets/images/buzz_4.webp',
      'assets/images/buzz_5.webp',
      'assets/images/buzz_6.webp',
      'assets/images/buzz_7.webp',
      'assets/images/buzz_8.webp',
      'assets/images/buzz_9.webp',
      'assets/images/buzz_10.webp',
      'assets/images/buzz_11.webp',
      'assets/images/buzz_12.webp',
    ],
  );

  static final _miTransicion = PortfolioProject(
    title: 'Mi Transición',
    description:
        'Designed and developed an app that allows patients of facial feminization to manage all aspects of their medical process, from scheduling appointments, to seeing simulations of their facial changes, paying for their procedure and more.\n'
        'Additionally, developed a backoffice for the medical center\'s staff to manage all aspects of the patients\' process, including scheduling appointments, managing payments, and more',
    techTools: {
      TechTool.flutter,
      TechTool.firebase,
      TechTool.nodeJS,
    },
    imageLogoAssetPath: 'assets/logos/mi_transicion_logo.webp',
    playStoreUrl: Uri.parse(
      'https://play.google.com/store/apps/details?id=com.redmars.mi_transicion',
    ),
    featuredImageAssetPath: 'assets/images/mt_0.webp',
    imageAssetPaths: [
      'assets/images/mt_0.webp',
      'assets/images/mt_1.webp',
      'assets/images/mt_2.webp',
      'assets/images/mt_3.webp',
      'assets/images/mt_4.webp',
      'assets/images/mt_5.webp',
    ],
  );
  static final _zurichOneApp = PortfolioProject(
    title: 'Zurich One App',
    description:
        'Built features for the One Zurich App mobile app. Among the challenges faced were: adding MSAL support with Platform Channels and adding support for SVG floor plane maps. \nHelped implement a Flutter Web backoffice for the app\'s content management system.',
    techTools: {
      TechTool.flutter,
    },
    imageLogoAssetPath: 'assets/logos/zurich_one_app_logo.webp',
    playStoreUrl: Uri.parse(
      'https://play.google.com/store/apps/details?id=com.zurich.onezurichglobal',
    ),
    appStoreUrl: Uri.parse(
      'https://apps.apple.com/ie/app/one-zurich-global/id1596260507',
    ),
    featuredImageAssetPath: 'assets/images/zurich_3.webp',
    imageAssetPaths: [
      'assets/images/zurich_0.webp',
      'assets/images/zurich_1.webp',
      'assets/images/zurich_2.webp',
      'assets/images/zurich_3.webp',
      'assets/images/zurich_4.webp',
    ],
  );

  static final _fundacionSaludSiglo21 = PortfolioProject(
    title: 'Fundación Salud Siglo 21',
    description:
        'I was in charge of the techincal aspects of the digitalization process of the Fundación Salud Siglo 21, a non-profit organization that provides medical services to vulnerable communities in Colombia.'
        '\nAmong the initial requirements were: overseeing the non-profit\'s rebranding process, creating a new website for the foundation, and a web app with integrations to third party payment providers in physical locations, that allows users to register, update their information, and pay the yearly membership fees both through physical payments and bank transfers. This effort also included several automations and integrations with their CRM.\n Additionally, I developed a directory web app that allows users to find medical practitioners, filtering by specializations, subspecializations, and medical procedures offered.\n',
    imageLogoAssetPath: 'assets/logos/fss21_logo.webp',
    featuredImageAssetPath: 'assets/images/fss21_0.webp',
    imageAssetPaths: [
      'assets/images/fss21_0.webp',
      'assets/images/fss21_1.webp',
      'assets/images/fss21_2.webp',
    ],
    website: Uri.parse('https://saludsiglo21.org'),
    techTools: {
      TechTool.react,
      TechTool.nodeJS,
      TechTool.postgres,
      TechTool.flutter,
      TechTool.wordpress,
    },
  );

  static final _profesionalesDeLaSalud = PortfolioProject(
    title: 'Profesionales de la Salud',
    description: 'Created a website for a medical practice in Colombia.\n'
        'Additionally, created a web app with automations for scheduling appointments, based on their requirements.',
    imageLogoAssetPath: 'assets/logos/pds_logo.webp',
    featuredImageAssetPath: 'assets/images/pds_0.webp',
    website: Uri.parse('profesionalesdelasalud.com.co'),
    imageAssetPaths: [
      'assets/images/pds_0.webp',
      'assets/images/pds_1.webp',
    ],
    techTools: {
      TechTool.nodeJS,
      TechTool.flutter,
      TechTool.wordpress,
    },
  );

  static final _centroMedicoCAL = PortfolioProject(
    title: 'Centro Médico Carlos Ardila Lülle',
    description: 'Oversaw the medical center\'s rebranding process.\n'
        'Created a website for the medical center, including a custom secion for the medical center\'s directory of medical practitioners.',
    imageLogoAssetPath: 'assets/logos/cal_logo.webp',
    website: Uri.parse('https://centromedicocal.com'),
    featuredImageAssetPath: 'assets/images/cal_0.webp',
    imageAssetPaths: [
      'assets/images/cal_0.webp',
      'assets/images/cal_1.webp',
    ],
    techTools: {
      TechTool.wordpress,
    },
  );

  static final projects = {
    _buzz,
    _miTransicion,
    _zurichOneApp,
    _fundacionSaludSiglo21,
    _centroMedicoCAL,
    _profesionalesDeLaSalud,
  };
}
