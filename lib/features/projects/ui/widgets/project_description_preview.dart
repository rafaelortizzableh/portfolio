import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class ProjectDescriptionPreview extends StatelessWidget {
  const ProjectDescriptionPreview({
    super.key,
    required this.portfolioProject,
    required this.onShowMoreDetailsPressed,
  });

  final PortfolioProject portfolioProject;
  final VoidCallback onShowMoreDetailsPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          onShowMoreDetailsPressed();
        }
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.85),
              Colors.black.withOpacity(0.75),
            ],
          ),
        ),
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Hero(
                        tag:
                            'project_details_${portfolioProject.imageLogoAssetPath}',
                        child: FadingAssetImage(
                          path: portfolioProject.imageLogoAssetPath,
                        ),
                      ),
                    ),
                    AppConstants.horizontalSpacing16,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            portfolioProject.title,
                            style: AppTextStyles.mediumStrong.copyWith(
                              color: Palette.white,
                            ),
                          ),
                          AppConstants.verticalSpacing4,
                          Text(
                            portfolioProject.description,
                            style: AppTextStyles.smallRegular.copyWith(
                              color: Palette.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.verticalSpacing8,
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton.icon(
                  icon: const Icon(
                    CupertinoIcons.chevron_up,
                    color: Palette.white,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: onShowMoreDetailsPressed,
                  label: Text(
                    context.l10n.viewMoreDetailsCta,
                    style: AppTextStyles.smallRegular.copyWith(
                      color: Palette.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
