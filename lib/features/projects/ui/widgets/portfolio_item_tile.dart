import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class ProjectItemTile extends StatefulWidget {
  const ProjectItemTile({super.key, required this.portfolioProject});
  final PortfolioProject portfolioProject;

  @override
  State<ProjectItemTile> createState() => _ProjectItemTileState();
}

class _ProjectItemTileState extends State<ProjectItemTile> {
  bool _hovered = false;
  bool _clicked = false;

  PortfolioProject get portfolioProject => widget.portfolioProject;

  void _onProjectTileTap(BuildContext context) {
    final navigator = Navigator.of(context);
    unawaited(
      navigator.pushNamed(
        ProjectPage.routeName,
        arguments: ProjectPageArguments(portfolioProject: portfolioProject),
      ),
    );
  }

  double get _opacity {
    final isDark = context.theme.brightness == Brightness.dark;
    if (_clicked) return isDark ? 0.5 : 0.95;
    if (_hovered) return isDark ? 0.75 : 0.9;
    return 1.0;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = context.theme.brightness;
    final gradientColors = [
      if (brightness == Brightness.dark) ...[
        Colors.black,
        Colors.black54,
        Colors.black38,
        Colors.grey.shade900,
      ] else ...[
        Colors.black,
        Colors.grey.shade900,
        Colors.grey.shade800,
        Colors.grey.shade700,
      ],
    ];

    return Padding(
      padding: AppConstants.horizontalPadding12,
      child: GestureDetector(
        onTap: () => _onProjectTileTap(context),
        onTapDown: (_) => setState(() => _clicked = true),
        onTapUp: (_) => setState(() => _clicked = false),
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() {
            _hovered = false;
            _clicked = false;
          }),
          cursor: SystemMouseCursors.click,
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: kThemeAnimationDuration,
            curve: Curves.easeInOut,
            child: AnimatedContainer(
              duration: kThemeAnimationDuration,
              curve: Curves.easeInOut,
              padding: AppConstants.padding12,
              decoration: BoxDecoration(
                border: Border.all(
                  color: brightness == Brightness.dark
                      ? Palette.grey
                      : Colors.transparent,
                ),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: AppConstants.borderRadius12,
              ),
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
        ),
      ),
    );
    // return Padding(
    //   padding: AppConstants.horizontalPadding12,
    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: backgroundColor,
    //       shape: const RoundedRectangleBorder(
    //         borderRadius: AppConstants.borderRadius12,
    //       ),
    //       textStyle: context.textTheme.bodyMedium?.copyWith(
    //         color: Palette.white,
    //       ),
    //       padding: AppConstants.padding16,
    //     ),
    //     onPressed: () => _onProjectTileTap(context),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Expanded(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               SizedBox(
    //                 height: 50.0,
    //                 width: 50.0,
    //                 child: FadingAssetImage(
    //                   path: portfolioProject.imageLogoAssetPath,
    //                 ),
    //               ),
    //               AppConstants.horizontalSpacing12,
    //               Expanded(
    //                 child: Text(
    //                   portfolioProject.title,
    //                   overflow: TextOverflow.ellipsis,
    //                   maxLines: 1,
    //                   style: context.textTheme.titleMedium?.copyWith(
    //                     color: Palette.white,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         ProjectRelevantLinks(
    //           website: portfolioProject.website,
    //           playStoreUrl: portfolioProject.playStoreUrl,
    //           appStoreUrl: portfolioProject.appStoreUrl,
    //           youtubeDemoUrl: portfolioProject.youtubeDemoUrl,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
