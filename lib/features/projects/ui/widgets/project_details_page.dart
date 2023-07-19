import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class ProjectDetailsPageArguments {
  const ProjectDetailsPageArguments({
    required this.portfolioProject,
  });

  final PortfolioProject portfolioProject;
}

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({
    super.key,
    required this.portfolioProject,
  });

  static const routeName = 'project_details';

  final PortfolioProject portfolioProject;

  @override
  Widget build(BuildContext context) {
    return StatusBarWrapper(
      statusBarStyle: StatusBarStyle.light,
      child: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 50.0,
                          child: Hero(
                            tag:
                                'project_details_${portfolioProject.imageLogoAssetPath}',
                            child: FadingAssetImage(
                              path: portfolioProject.imageLogoAssetPath,
                            ),
                          ),
                        ),
                      ),
                      AppConstants.verticalSpacing8,
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          portfolioProject.title,
                          style: AppTextStyles.mediumStrong.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                      AppConstants.verticalSpacing8,
                      Padding(
                        padding: AppConstants.horizontalPadding8,
                        child: Text(
                          portfolioProject.description,
                          style: AppTextStyles.smallRegular.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      AppConstants.verticalSpacing12,
                      Padding(
                        padding: AppConstants.horizontalPadding8,
                        child: Text(
                          context.l10n.toolsAndTechnologies,
                          style: AppTextStyles.mediumStrong.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      AppConstants.verticalSpacing8,
                      Padding(
                        padding: AppConstants.horizontalPadding4,
                        child: TechToolsWrap(
                          techTools: portfolioProject.techTool,
                        ),
                      ),
                      AppConstants.verticalSpacing12,
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ProjectRelevantLinks(
                          appStoreUrl: portfolioProject.appStoreUrl,
                          playStoreUrl: portfolioProject.playStoreUrl,
                          website: portfolioProject.website,
                          youtubeDemoUrl: portfolioProject.youtubeDemoUrl,
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: AppConstants.spacing4,
                  left: AppConstants.spacing24,
                  child: CloseFullScreenButton(color: Palette.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
