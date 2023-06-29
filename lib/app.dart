import 'dart:async';

import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/features.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => context.l10n.appName,
      theme: CustomTheme.lightTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) {
          return StatusBarWrapper(
            child: Scaffold(
              bottomNavigationBar: const ContactIconsWrap(),
              body: SafeArea(
                bottom: true,
                child: Column(
                  children: [
                    const PortfolioHeader(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return PorfolioItemTile(
                            portfolioProject: (
                              title: 'Mi Transición',
                              description:
                                  'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                              imageLogoAssetPath:
                                  'assets/logos/mi_transicion_logo.webp',
                              featuredImageAssetPath:
                                  'assets/images/mt_image_1.webp',
                              website: Uri.parse('https://google.com'),
                              playStoreUrl: Uri.parse('https://google.com'),
                              appStoreUrl: Uri.parse('https://google.com'),
                              imageAssetPaths: [
                                'assets/images/mt_image_1.webp',
                                'assets/images/mt_image_2.webp',
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PorfolioItemTile extends StatelessWidget {
  const PorfolioItemTile({
    super.key,
    required this.portfolioProject,
  });

  // static const _emptyNumber = 0.0;
  final PortfolioProject portfolioProject;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.textTheme.bodyMedium?.copyWith(
            color: Palette.white,
          ) ??
          const TextStyle(
            color: Palette.white,
            fontFamily: ThemeFonts.montserrat,
          ),
      child: GestureDetector(
        onTap: () => _onProjectTileTap(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
            vertical: AppConstants.verticalPadding / 2,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalPadding,
              vertical: AppConstants.verticalPadding,
            ),
            decoration: BoxDecoration(
              color: Palette.black,
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   height: 50,
                //   child: AspectRatio(
                //     aspectRatio: 1.0,
                //     child: ShaderMask(
                //       blendMode: BlendMode.dstIn,
                //       shaderCallback: (rect) => const LinearGradient(
                //         begin: Alignment.center,
                //         end: Alignment.centerLeft,
                //         colors: [
                //           Palette.black,
                //           Colors.transparent,
                //         ],
                //       ).createShader(
                //         Rect.fromLTRB(
                //           _emptyNumber,
                //           rect.height,
                //           rect.width,
                //           _emptyNumber,
                //         ),
                //       ),
                //       child: FadingAssetImage(
                //         path: portfolioItem.imageLogoAssetPath,
                //       ),
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.0,
                      child: FadingAssetImage(
                        path: portfolioProject.imageLogoAssetPath,
                      ),
                    ),
                    const SizedBox(
                      width: AppConstants.horizontalPadding,
                    ),
                    Text(portfolioProject.title),
                  ],
                ),
                ProjectRelevantLinks(
                  website: portfolioProject.website,
                  playStoreUrl: portfolioProject.playStoreUrl,
                  appStoreUrl: portfolioProject.appStoreUrl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onProjectTileTap(BuildContext context) {
    final navigator = Navigator.of(context);
    unawaited(
      navigator.push(
        ModalBottomSheetRoute(
          builder: (context) => ProjectPage(
            portfolioProject: portfolioProject,
          ),
          isScrollControlled: true,
        ),
      ),
    );
  }
}

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppConstants.verticalPadding,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
            BorderSide(
              color: Palette.grey,
              width: 4.0,
            ),
          ),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Rafael '.toUpperCase(),
                    style: AppTextStyles.h1.copyWith(
                      color: Palette.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'Ortiz '.toUpperCase(),
                        style: AppTextStyles.h1.copyWith(
                          color: Palette.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Zableh'.toUpperCase(),
                        style: AppTextStyles.h1.copyWith(
                          color: Palette.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: AppConstants.verticalPadding,
              ),
              Text(
                context.l10n.softwareEngineer.toUpperCase(),
                style: AppTextStyles.mediumRegular.copyWith(
                  color: Palette.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
