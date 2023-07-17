import '../../features.dart';

abstract class PortfolioProjects {
  static final _buzz = PortfolioProject(
    title: 'Join Buzz',
    description:
        'Lead the technical efforts of pivoting from a video-calling web application for hybrid teams, into a menu bar app for product teams and software developers, full of integrations with third party tools, that shows information about your current workday as well as your teammates\' in real time.',
    techTool: {
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
        'Designed and developed an app that allows patients of facial feminization to manage all aspects of their medical process, from scheduling appointments, to seeing simulations of their facial changes, paying for their procedure and more.',
    techTool: {
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
    description: 'Built features for the One Zurich App mobile app.',
    techTool: {
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

  static final projects = {
    _buzz,
    _miTransicion,
    _zurichOneApp,
  };
}
