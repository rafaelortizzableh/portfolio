import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class TechToolsWrap extends StatelessWidget {
  const TechToolsWrap({
    super.key,
    required this.techTools,
    this.shouldhighlightTopTechTools = false,
  });

  final Set<TechTool> techTools;
  final bool shouldhighlightTopTechTools;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: AppConstants.spacing4,
      runSpacing: AppConstants.spacing4,
      children: [
        ...techTools.map(
          (techTool) => TechToolTile(
            techTool: techTool,
            shouldhighlightTopTechTool: shouldhighlightTopTechTools,
          ),
        ),
      ],
    );
  }
}

class TechToolTile extends StatelessWidget {
  const TechToolTile({
    super.key,
    required this.techTool,
    required this.shouldhighlightTopTechTool,
  });

  final TechTool techTool;
  final bool shouldhighlightTopTechTool;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74.0,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: AppConstants.borderRadius12,
                ),
                child: Padding(
                  padding: AppConstants.padding4,
                  child: Image.asset(
                    techTool.iconAsset,
                    width: 42.0,
                  ),
                ),
              ),
              AppConstants.verticalSpacing4,
              Text(
                techTool.label,
                style: AppTextStyles.smallRegular.copyWith(
                  color: Palette.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          if (techTool.isTopTechTool && shouldhighlightTopTechTool) ...[
            const Positioned(
              top: -8.0,
              right: 0.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Palette.black,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: AppConstants.padding4,
                  child: Icon(
                    Icons.star,
                    size: 12.0,
                    color: Palette.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
