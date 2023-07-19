import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class TechToolsWrap extends StatelessWidget {
  const TechToolsWrap({
    super.key,
    required this.techTools,
  });

  final Set<TechTool> techTools;

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
  });

  final TechTool techTool;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74.0,
      child: Column(
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
    );
  }
}
