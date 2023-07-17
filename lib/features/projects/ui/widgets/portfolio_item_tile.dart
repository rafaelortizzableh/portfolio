import 'dart:async';

import 'package:flutter/material.dart';

import '../../../features.dart';
import '../../../../core/core.dart';

class PorfolioItemTile extends StatefulWidget {
  const PorfolioItemTile({
    super.key,
    required this.portfolioProject,
  });

  final PortfolioProject portfolioProject;

  @override
  State<PorfolioItemTile> createState() => _PorfolioItemTileState();
}

class _PorfolioItemTileState extends State<PorfolioItemTile> {
  bool _hovered = false;
  bool _tapped = false;

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
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() {
          _hovered = false;
          _tapped = false;
        }),
        child: GestureDetector(
          onTapDown: (details) => setState(() => _tapped = true),
          onTapUp: (details) => setState(() => _tapped = false),
          onTap: () => _onProjectTileTap(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing12,
              vertical: AppConstants.spacing6,
            ),
            child: AnimatedOpacity(
              duration: kThemeAnimationDuration,
              opacity: _opacity,
              child: Container(
                padding: AppConstants.padding12,
                decoration: const BoxDecoration(
                  color: Palette.black,
                  borderRadius: AppConstants.borderRadius12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.0,
                          child: FadingAssetImage(
                            path: widget.portfolioProject.imageLogoAssetPath,
                          ),
                        ),
                        AppConstants.horizontalSpacing12,
                        Text(widget.portfolioProject.title),
                      ],
                    ),
                    ProjectRelevantLinks(
                      website: widget.portfolioProject.website,
                      playStoreUrl: widget.portfolioProject.playStoreUrl,
                      appStoreUrl: widget.portfolioProject.appStoreUrl,
                      youtubeDemoUrl: widget.portfolioProject.youtubeDemoUrl,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get _opacity {
    if (_tapped) {
      return 0.75;
    }
    if (_hovered) {
      return 0.85;
    }
    return 1.0;
  }

  void _onProjectTileTap(BuildContext context) {
    final navigator = Navigator.of(context);
    unawaited(
      navigator.push(
        // MaterialPageRoute(
        ModalBottomSheetRoute(
          isScrollControlled: true,
          builder: (context) => ProjectPage(
            portfolioProject: widget.portfolioProject,
          ),
        ),
      ),
    );
  }
}
