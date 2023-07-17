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
    return Padding(
      padding: AppConstants.horizontalPadding12,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: AppConstants.spacing12,
        runSpacing: AppConstants.spacing12,
        children: [
          ...techTools.map(
            (techTool) => TechToolTile(
              techTool: techTool,
            ),
          ),
        ],
      ),
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
    return Column(
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
        ),
      ],
    );
  }
}
