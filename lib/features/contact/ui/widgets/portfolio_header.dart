import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class PortfolioHeader extends StatelessWidget implements PreferredSizeWidget {
  const PortfolioHeader({
    super.key,
  });

  static const _preferedHeight = 100.0;
  static const _cardElevation = 8.0;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppConstants.padding4,
      child: Card(
        elevation: _cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.borderRadius12,
        ),
        child: Stack(
          children: [
            _BackgroundDecoration(),
            _GradientDecoration(),
            Padding(
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
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, _preferedHeight);
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./assets/images/header.webp'),
            fit: BoxFit.cover,
          ),
          borderRadius: AppConstants.borderRadius12,
        ),
      ),
    );
  }
}

class _GradientDecoration extends StatelessWidget {
  const _GradientDecoration({
    // ignore: unused_element
    super.key,
  });
  static final _gradientColors = [
    Palette.black.withOpacity(0.25),
    Colors.transparent,
    Palette.black.withOpacity(0.25),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: AppConstants.borderRadius12,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showImage && !isWithinDeviceFrame) ...[
          const _ProfilePicture(),
          AppConstants.verticalSpacing8,
        ],
        Flexible(
          child: Text(
            title.toUpperCase(),
            style: titleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        if (showHeadline && !isWithinDeviceFrame) ...[
          AppConstants.verticalSpacing4,
          Flexible(
            child: Text(
              context.l10n.softwareDeveloper.toUpperCase(),
              style: AppTextStyles.mediumRegular.copyWith(
                color: Palette.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }
}
