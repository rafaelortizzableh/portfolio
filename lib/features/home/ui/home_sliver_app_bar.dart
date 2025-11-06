import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../features.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    super.key,
    required this.isWithinDeviceFrame,
  });

  final bool isWithinDeviceFrame;

  @override
  Widget build(BuildContext context) {
    return FadingLargeSliverAppBar(
      leading: !isWithinDeviceFrame
          ? const HomeDrawerFAB()
          : AppConstants.emptySpace,
      fadeAt: context.height * 0.25,
      stretch: true,
      expandedHeight: context.height * 0.33,
      backgroundColor: Palette.black,
      foregroundColor: Palette.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      background: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: AppConstants.circularRadius4,
            bottomStart: AppConstants.circularRadius4,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox.expand(
              child: ColoredBox(color: Palette.white),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('./assets/images/header.webp'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(4.0),
                    bottomStart: Radius.circular(4.0),
                  ),
                ),
              ),
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Palette.black.withValues(alpha: 0.5),
                      Colors.transparent,
                      Palette.black.withValues(alpha: 0.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: AppBarTitle.onExpandedAppBar(
                    isWithinDeviceFrame: isWithinDeviceFrame,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      stretchModes: const [
        StretchMode.fadeTitle,
        StretchMode.zoomBackground,
        StretchMode.blurBackground
      ],
      title: AppBarTitle.onCollapsedAppBar(
        isWithinDeviceFrame: isWithinDeviceFrame,
      ),
    );
  }
}
