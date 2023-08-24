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
      TechTool.figma,
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
      TechTool.figma,
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
        'Built features for the One Zurich App mobile app.\nAmong the challenges faced by my team were:\n'
        '- Adding support for MSAL through Platform Channels (Swift + Kotlin).\n'
        '- Adding support for SVG floor plane maps.\n'
        '- Implementing a custom a Flutter Web backoffice for the app\'s content management system.',
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
        'I was in charge of the techincal aspects of the digitalization process of the Fundación Salud Siglo 21, a non-profit organization that provides medical services to vulnerable communities in Colombia.\n'
        'This included:\n'
        '- Overseeing the non-profit\'s rebranding process.\n'
        '- Creating a new website for the foundation.\n'
        '- Creating a full-stack web app that allows users to register, update their information, and pay the yearly membership fees both through physical payments and bank transfers. The app includes integrations with third party APIs for payments, insertion of data into their CRM and Google Sheets, among others.\n'
        '- Creating a directory web app that allows users to find medical practitioners, filtering by specializations, subspecializations, and medical procedures offered.\n'
        '- Providing consulting services for the non-profit\'s digitalization process. This included a Social Media and basic design training.\n',
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
      TechTool.figma,
    },
  );

  static final _profesionalesDeLaSalud = PortfolioProject(
    title: 'Profesionales de la Salud',
    description: '- Created a website for the medical practice.\n'
        '- Created a web app for scheduling appointments based on their requirements.\n'
        '- Created serverless automations for the appointment scheduling process, including integrations with third party APIs.',
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
      TechTool.figma,
      TechTool.html,
    },
  );

  static final _centroUrologicoFoscal = PortfolioProject(
    title: 'Centro Urológico Foscal',
    description: '- Oversaw the medical practice\'s rebranding process.\n'
        '- Created a website for the medical practice.\n'
        '- Provided maintenance and support for the medical practice\'s website.\n'
        '- Provided consulting services for the medical practice\'s digitalization process.\n'
        '- Provided internal and external communications consulting services for the medical practice.\n'
        '- Created and implemented a successful SEO strategy for the medical practice.',
    imageLogoAssetPath: 'assets/logos/cuf_logo.webp',
    website: Uri.parse('https://centrourologico.org'),
    featuredImageAssetPath: 'assets/images/cuf_0.webp',
    imageAssetPaths: [
      'assets/images/cuf_0.webp',
      'assets/images/cuf_1.webp',
    ],
    techTools: {
      TechTool.html,
      TechTool.figma,
    },
  );

  static final _spectMedicinaNuclear = PortfolioProject(
    title: 'Spect Medicina Nuclear',
    description: '- Created a website for the medical practice.\n'
        '- Provided maintenance and support for the medical practice\'s website.\n'
        '- Created and implemented a successful SEO strategy for the medical practice.',
    imageLogoAssetPath: 'assets/logos/spect_logo.webp',
    website: Uri.parse('https://spectmedicinanuclear.com'),
    featuredImageAssetPath: 'assets/images/spect_0.webp',
    imageAssetPaths: [
      'assets/images/spect_0.webp',
    ],
    techTools: {
      TechTool.html,
      TechTool.figma,
    },
  );

  static final _elCieloDeMila = PortfolioProject(
    title: 'El Cielo de Mila',
    description: '- Created a website for the non-profit store.\n'
        '- Provided maintenance and support for the non-profit\'s website.\n',
    imageLogoAssetPath: 'assets/logos/ecdm_logo.webp',
    website: Uri.parse('https://elcielodemila.com'),
    featuredImageAssetPath: 'assets/images/ecdm_0.webp',
    imageAssetPaths: [
      'assets/images/ecdm_0.webp',
      'assets/images/ecdm_1.webp',
    ],
    techTools: {
      TechTool.html,
      TechTool.figma,
      TechTool.wordpress,
    },
  );

  static final _aquaBottles = PortfolioProject(
    title: 'Aqua bottles',
    description:
        '- Created an e-commerce website for the water bottles business.\n'
        '- Created serverless automations to record new purchases and abandonded shopping carts on Google Sheets and send notifications on Telegram.\n'
        '- Provided maintenance and support for the website.\n',
    imageLogoAssetPath: 'assets/logos/aqua_logo.webp',
    featuredImageAssetPath: 'assets/images/aqua_0.webp',
    website: Uri.parse('https://aqua-col.com'),
    imageAssetPaths: [
      'assets/images/aqua_0.webp',
      'assets/images/aqua_1.webp',
    ],
    techTools: {
      TechTool.nodeJS,
      TechTool.wordpress,
      TechTool.figma,
      TechTool.html,
    },
  );

  static final _mascooty = PortfolioProject(
    title: 'Mascooty',
    description:
        'Designed and developed the MVP of a mobile application that allows '
        'pet owners to sell and buy pet products and services.',
    imageLogoAssetPath: 'assets/logos/mascooty_logo.webp',
    featuredImageAssetPath: 'assets/images/mascooty_0.webp',
    imageAssetPaths: [
      'assets/images/mascooty_0.webp',
      'assets/images/mascooty_1.webp',
      'assets/images/mascooty_2.webp',
    ],
    playStoreUrl: Uri.parse(
      'https://play.google.com/store/apps/details?id=com.mascooty.app',
    ),
    techTools: {
      TechTool.flutter,
      TechTool.figma,
      TechTool.firebase,
    },
  );

  static final _allInBiking = PortfolioProject(
    title: 'All in Biking',
    description:
        'Designed and developed the first iteration of the MVP of a mobile application that allows '
        'bike owners to register their bikes, and in case of theft, report it and get help from the community to find it; as well as ride with other bikers.',
    imageLogoAssetPath: 'assets/logos/aib_logo.webp',
    featuredImageAssetPath: 'assets/images/aib_0.webp',
    imageAssetPaths: [
      'assets/images/aib_0.webp',
      'assets/images/aib_1.webp',
      'assets/images/aib_2.webp',
      'assets/images/aib_3.webp',
    ],
    website: Uri.parse('https://allinbiking.com'),
    techTools: {
      TechTool.html,
      TechTool.figma,
    },
  );

  static final _descupApp = PortfolioProject(
    title: 'Descup App',
    description:
        'Developed features and fixed bugs for the Descup App mobile app.\n'
        'The app allows users to find better deals for their utilities.',
    imageLogoAssetPath: 'assets/logos/descup_logo.webp',
    featuredImageAssetPath: 'assets/images/descup_0.webp',
    imageAssetPaths: [
      'assets/images/descup_0.webp',
      'assets/images/descup_1.webp',
      'assets/images/descup_2.webp',
      'assets/images/descup_3.webp',
    ],
    playStoreUrl: Uri.parse(
      'https://play.google.com/store/apps/details?id=com.descup.app',
    ),
    appStoreUrl: Uri.parse(
      'https://play.google.com/store/apps/details?id=com.descup.app',
    ),
    techTools: {
      TechTool.flutter,
      TechTool.firebase,
      TechTool.nodeJS,
      TechTool.figma,
    },
  );

  static final _ingeoExpert = PortfolioProject(
    title: 'Ingeoexpert',
    description:
        'Developed features for the e-learning platform\'s mobile app.\n'
        '- Created a custom video player that allows users to view videos without using Vimeo.\n'
        '- Created a custom PDF viewer that allows users to view PDFs without using Google Drive.\n'
        '- Integrated the app with Wordpress and Moodle APIs to allow users to purchase and view courses.\n'
        '- Added support for social media login.\n'
        '- Improve the app\'s UX/UI design based on requirements.\n',
    imageLogoAssetPath: 'assets/logos/ingeo_logo.webp',
    featuredImageAssetPath: 'assets/images/ingeo_0.webp',
    imageAssetPaths: [
      'assets/images/ingeo_0.webp',
      'assets/images/ingeo_1.webp',
      'assets/images/ingeo_2.webp',
      'assets/images/ingeo_3.webp',
      'assets/images/ingeo_4.webp',
    ],
    website: Uri.parse(
      'https://ingeoexpert.com',
    ),
    playStoreUrl: Uri.parse(
      'https://play.google.com/store/apps/details?id=com.ingeoexpert.mobile',
    ),
    appStoreUrl: Uri.parse(
      'https://apps.apple.com/es/app/ingeoexpert/id1624441829',
    ),
    techTools: {
      TechTool.html,
      TechTool.figma,
    },
  );

  static final projects = {
    _buzz,
    _miTransicion,
    _zurichOneApp,
    _fundacionSaludSiglo21,
    _centroMedicoCAL,
    _profesionalesDeLaSalud,
    _centroUrologicoFoscal,
    _spectMedicinaNuclear,
    _aquaBottles,
    _elCieloDeMila,
    _mascooty,
    _allInBiking,
    _descupApp,
    _ingeoExpert,
  };
}
