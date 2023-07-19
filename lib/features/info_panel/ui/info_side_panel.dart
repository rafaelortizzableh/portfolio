import 'package:flutter/material.dart';
import 'package:portfolio_roz/core/core.dart';

import '../../features.dart';

class InfoSidePanel extends StatelessWidget {
  const InfoSidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = InfoPanelData.getLanguageRecords(context.l10n);
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: _boxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(
            top: kToolbarHeight,
          ),
          child: ListView(
            padding: AppConstants.padding16,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  context.l10n.aboutMe.toUpperCase(),
                  style: AppTextStyles.mediumStrong.copyWith(
                    color: Palette.white,
                    fontSize: AppTextStyles.h1.fontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              AppConstants.verticalSpacing24,
              Text(
                context.l10n.languages.toUpperCase(),
                style: _subTitlesTextStyle,
              ),
              AppConstants.verticalSpacing8,
              Column(
                children: languages
                    .map(
                      (lang) => _LanguageTile(
                        language: lang.language,
                        level: lang.level,
                      ),
                    )
                    .toList(),
              ),
              AppConstants.verticalSpacing16,
              Text(
                context.l10n.toolsAndTechnologies.toUpperCase(),
                style: _subTitlesTextStyle,
              ),
              AppConstants.verticalSpacing8,
              TechToolsWrap(
                techTools: Set.from(TechTool.values),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const _boxDecoration = BoxDecoration(
    color: Palette.grey,
  );

  TextStyle get _subTitlesTextStyle => AppTextStyles.mediumStrong.copyWith(
        color: Palette.white,
        fontSize: 18.0,
      );
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.language,
    required this.level,
  });

  final String language;
  final double level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: AppTextStyles.mediumRegular.copyWith(
            color: Palette.white,
          ),
        ),
        AnimatedHorizontalBar(
          value: level,
          width: 100.0,
        ),
      ],
    );
  }
}

class AnimatedHorizontalBar extends StatefulWidget {
  const AnimatedHorizontalBar({
    super.key,
    required this.value,
    this.heigth = 10.0,
    this.width = double.infinity,
  }) : assert(value >= 0.0 && value <= 1.0, 'Value must be between 0 and 1');

  final double value;
  final double heigth;
  final double width;

  @override
  State<AnimatedHorizontalBar> createState() => _AnimatedHorizontalBarState();
}

class _AnimatedHorizontalBarState extends State<AnimatedHorizontalBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.value,
    ).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedHorizontalBar oldWidget) {
    if (oldWidget.value != widget.value) {
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  static const _borderRadius = BorderRadius.all(Radius.circular(5.0));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.heigth,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          return Stack(
            children: [
              Container(
                width: widget.width,
                height: widget.heigth,
                decoration: BoxDecoration(
                  color: Palette.white.withOpacity(0.2),
                  borderRadius: _borderRadius,
                ),
              ),
              Container(
                width: widget.width * _animation.value,
                height: widget.heigth,
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: _borderRadius,
                  border: Border.all(
                    color: Palette.white.withOpacity(0.2),
                    width: 1.0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
