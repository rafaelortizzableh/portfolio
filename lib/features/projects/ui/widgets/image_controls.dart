import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ImageControls extends StatelessWidget {
  const ImageControls({
    super.key,
    required this.shouldShowNextImageButton,
    required this.shouldShowPreviousImageButton,
    required this.onNextImageButtonPressed,
    required this.onPreviousImageButtonPressed,
    required this.shouldShowPageControls,
    required this.projectTitle,
  });

  final bool shouldShowNextImageButton;
  final bool shouldShowPreviousImageButton;
  final VoidCallback onNextImageButtonPressed;
  final VoidCallback onPreviousImageButtonPressed;
  final bool shouldShowPageControls;
  final String projectTitle;

  static const _animationDuration = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: _animationDuration,
      opacity: shouldShowPageControls ? 1 : 0,
      child: IgnorePointer(
        ignoring: !shouldShowPageControls,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            children: [
              AnimatedOpacity(
                duration: _animationDuration,
                opacity: shouldShowPreviousImageButton ? 1 : 0,
                child: IgnorePointer(
                  ignoring: !shouldShowPreviousImageButton,
                  child: GenericIconButton(
                    key: ObjectKey(
                      'previous_image_button_$projectTitle',
                    ),
                    icon: Icons.arrow_circle_up,
                    tooltipMesssage: context.l10n.previousImageCta,
                    onPressed: onPreviousImageButtonPressed,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: _animationDuration,
                opacity: shouldShowNextImageButton ? 1 : 0,
                child: IgnorePointer(
                  ignoring: !shouldShowNextImageButton,
                  child: GenericIconButton(
                    key: ObjectKey(
                      'next_image_button_$projectTitle',
                    ),
                    icon: Icons.arrow_circle_down,
                    tooltipMesssage: context.l10n.nextImageCta,
                    onPressed: onNextImageButtonPressed,
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
