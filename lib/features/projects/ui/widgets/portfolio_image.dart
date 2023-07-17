import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class PorfolioImage extends StatelessWidget {
  const PorfolioImage({
    super.key,
    required this.heroTag,
    required this.imageAsset,
    required this.imageAssetPaths,
  });

  final String heroTag;
  final String imageAsset;
  final List<String> imageAssetPaths;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: heroTag,
          child: FadingAssetImage(
            path: imageAsset,
          ),
        ),
      ],
    );
  }
}
