import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppConstants.padding12,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./assets/images/header.webp'),
            fit: BoxFit.cover,
          ),
          borderRadius: AppConstants.borderRadius12,
        ),
        child: Padding(
          padding: AppConstants.padding12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProfilePicture(),
              AppConstants.horizontalSpacing12,
              AppBarTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture();
  static const _profilePictureAsset = 'assets/images/profile_picture.webp';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 80.0,
        maxHeight: 80.0,
      ),
      child: const FadingAssetImage(
        path: _profilePictureAsset,
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    this.titleTextStyle,
    this.showHeadline = true,
    this.showImage = false,
    this.isWithinDeviceFrame = false,
  });

  factory AppBarTitle.onExpandedAppBar({
    bool isWithinDeviceFrame = false,
  }) {
    return AppBarTitle(
      showHeadline: true,
      showImage: true,
      isWithinDeviceFrame: isWithinDeviceFrame,
    );
  }

  factory AppBarTitle.onCollapsedAppBar({
    bool isWithinDeviceFrame = false,
  }) {
    return AppBarTitle(
      showHeadline: false,
      showImage: false,
      titleTextStyle: AppTextStyles.h2.copyWith(
        color: Palette.white,
      ),
      isWithinDeviceFrame: isWithinDeviceFrame,
    );
  }

  final bool showHeadline;
  final bool showImage;
  final TextStyle? titleTextStyle;
  final bool isWithinDeviceFrame;

  @override
  Widget build(BuildContext context) {
    final title = isWithinDeviceFrame
        ? context.l10n.projects
        : AppConstants.developerName;
    final titleTextStyle = this.titleTextStyle ??
        AppTextStyles.h1.copyWith(
          color: Palette.white,
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showImage) ...[
          const _ProfilePicture(),
          AppConstants.verticalSpacing8,
        ],
        Text(
          title.toUpperCase(),
          style: titleTextStyle,
        ),
        if (showHeadline) ...[
          AppConstants.verticalSpacing4,
          Text(
            context.l10n.softwareEngineer.toUpperCase(),
            style: AppTextStyles.mediumRegular.copyWith(
              color: Palette.white,
            ),
          ),
        ],
      ],
    );
  }
}
