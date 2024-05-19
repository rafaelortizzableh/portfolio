import 'package:portfolio_roz/core/core.dart';

import '../../features.dart';

abstract class PortfolioProjects {
  static PortfolioProject _buzz(AppLocalizations l10n) => PortfolioProject(
        title: 'Join Buzz',
        description: l10n.joinBuzzProjectDescription,
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

  static PortfolioProject _miTransicion(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Mi Transición',
        description: l10n.miTransicionProjectDescription,
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
  static PortfolioProject _zurichOneApp(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Zurich One App',
        description: l10n.zurichOneAppProjectDescription,
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

  static PortfolioProject _fundacionSaludSiglo21(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Fundación Salud Siglo 21',
        description: l10n.fundacionSaludSiglo21ProjectDescription,
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

  static PortfolioProject _profesionalesDeLaSalud(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Profesionales de la Salud',
        description: l10n.profesionalesDeLaSaludProjectDescription,
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

  static PortfolioProject _centroMedicoCAL(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Centro Médico Carlos Ardila Lülle',
        description: l10n.centroMedicoCALProjectDescription,
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

  static PortfolioProject _centroUrologicoFoscal(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Centro Urológico Foscal',
        description: l10n.centroUrologicoFoscalProjectDescription,
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

  static PortfolioProject _spectMedicinaNuclear(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Spect Medicina Nuclear',
        description: l10n.spectMedicinaNuclearProjectDescription,
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

  static PortfolioProject _elCieloDeMila(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'El Cielo de Mila',
        description: l10n.elCieloDeMilaProjectDescription,
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

  static PortfolioProject _aquaBottles(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Aqua bottles',
        description: l10n.aquaBottlesProjectDescription,
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

  static PortfolioProject _mascooty(AppLocalizations l10n) => PortfolioProject(
        title: 'Mascooty',
        description: l10n.mascootyProjectDescription,
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

  static PortfolioProject _allInBiking(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'All in Biking',
        description: l10n.allInBikingProjectDescription,
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
          TechTool.flutter,
          TechTool.firebase,
          TechTool.html,
          TechTool.figma,
        },
      );

  static PortfolioProject _descupApp(AppLocalizations l10n) => PortfolioProject(
        title: 'Descup App',
        description: l10n.descupAppProjectDescription,
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

  static PortfolioProject _ingeoExpert(AppLocalizations l10n) =>
      PortfolioProject(
        title: 'Ingeoexpert',
        description: l10n.ingeoExpertProjectDescription,
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
          TechTool.flutter,
          TechTool.firebase,
          TechTool.figma,
        },
      );

  static Set<PortfolioProject> projects(AppLocalizations l10n) => {
        _buzz(l10n),
        _miTransicion(l10n),
        _zurichOneApp(l10n),
        _fundacionSaludSiglo21(l10n),
        _centroMedicoCAL(l10n),
        _profesionalesDeLaSalud(l10n),
        _centroUrologicoFoscal(l10n),
        _spectMedicinaNuclear(l10n),
        _aquaBottles(l10n),
        _elCieloDeMila(l10n),
        _mascooty(l10n),
        _allInBiking(l10n),
        _descupApp(l10n),
        _ingeoExpert(l10n),
      };
}
