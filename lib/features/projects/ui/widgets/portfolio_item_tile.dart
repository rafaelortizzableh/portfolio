import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class ProjectItemTile extends StatelessWidget {
  const ProjectItemTile({
    super.key,
    required this.portfolioProject,
  });

  final PortfolioProject portfolioProject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.horizontalPadding12,
      child: Tooltip(
        message: context.l10n.viewProjectCta(portfolioProject.title),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Palette.black,
            shape: const RoundedRectangleBorder(
              borderRadius: AppConstants.borderRadius12,
            ),
            textStyle: context.textTheme.bodyMedium?.copyWith(
                  color: Palette.white,
                ) ??
                const TextStyle(
                  color: Palette.white,
                  fontFamily: ThemeFonts.montserrat,
                ),
            padding: AppConstants.padding16,
          ),
          onPressed: () => _onProjectTileTap(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: FadingAssetImage(
                        path: portfolioProject.imageLogoAssetPath,
                      ),
                    ),
                    AppConstants.horizontalSpacing12,
                    Expanded(
                      child: Text(
                        portfolioProject.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: Palette.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ProjectRelevantLinks(
                website: portfolioProject.website,
                playStoreUrl: portfolioProject.playStoreUrl,
                appStoreUrl: portfolioProject.appStoreUrl,
                youtubeDemoUrl: portfolioProject.youtubeDemoUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onProjectTileTap(BuildContext context) {
    final navigator = Navigator.of(context);
    unawaited(
      navigator.pushNamed(
        ProjectPage.routeName,
        arguments: ProjectPageArguments(portfolioProject: portfolioProject),
      ),
    );
  }
}
