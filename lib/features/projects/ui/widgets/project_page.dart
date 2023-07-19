import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class ProjectPageArguments {
  const ProjectPageArguments({
    required this.portfolioProject,
    this.backgroundDecoration = const BoxDecoration(
      color: Palette.black,
    ),
  });

  final PortfolioProject portfolioProject;
  final BoxDecoration backgroundDecoration;
}

class ProjectPage extends StatefulWidget {
  const ProjectPage({
    super.key,
    required this.portfolioProject,
    this.backgroundDecoration = const BoxDecoration(
      color: Palette.black,
    ),
  });

  static const routeName = 'project';

  final PortfolioProject portfolioProject;
  final BoxDecoration backgroundDecoration;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final AnimationController _animationController;
  final _transformationController = TransformationController();
  late final FocusNode _focusNode;

  bool _isDetailsPreviewPanelShown = true;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
    _focusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.removeListener(_updateCurrentPage);
    _pageController.dispose();
    _transformationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minWidth = context.width;

    return StatusBarWrapper(
      statusBarStyle: StatusBarStyle.light,
      child: DefaultTextStyle(
        style: context.textTheme.bodyMedium?.copyWith(
              color: Palette.white,
            ) ??
            const TextStyle(
              color: Palette.white,
              fontFamily: ThemeFonts.montserrat,
            ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: FocusableActionDetector(
            focusNode: _focusNode,
            onFocusChange: (_) => _focusNode.requestFocus(),
            shortcuts: {
              ...ShortcutIntents.navigateVertical(
                onNavigate: (direction) {
                  _navigateVertical(direction);
                },
              ),
              ...ShortcutIntents.closePopupOnEnterOrEscape(
                context,
                closeOnEnter: false,
              ),
            },
            actions: {
              ...ShortcutActions.navigateVertical,
              ...ShortcutActions.closePopup,
            },
            child: SafeArea(
              top: false,
              bottom: false,
              child: SizedBox.expand(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox.expand(
                      child: DecoratedBox(
                        decoration: widget.backgroundDecoration,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          _toggleTitleShown(!_isDetailsPreviewPanelShown),
                      child: SizedBox(
                        child: PageView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              widget.portfolioProject.imageAssetPaths.length,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            final imageAsset =
                                widget.portfolioProject.imageAssetPaths[index];
                            final heroTag = _createHeroTag(
                              imageAsset: imageAsset,
                              index: _currentImageIndex,
                            );

                            return PorfolioImage(
                              heroTag: heroTag,
                              imageAsset: imageAsset,
                              imageAssetPaths:
                                  widget.portfolioProject.imageAssetPaths,
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: kToolbarHeight * 2,
                          minWidth: minWidth,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (_shouldShowPageControls) ...[
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                children: [
                                  AnimatedOpacity(
                                    duration: kThemeAnimationDuration,
                                    opacity: _showPreviousImageButton ? 1 : 0,
                                    child: GenericIconButton(
                                      icon: Icons.arrow_circle_up,
                                      onPressed: _onPreviousImageButtonPressed,
                                    ),
                                  ),
                                  AnimatedOpacity(
                                    duration: kThemeAnimationDuration,
                                    opacity: _showNextImageButton ? 1 : 0,
                                    child: GenericIconButton(
                                      icon: Icons.arrow_circle_down,
                                      onPressed: _onNextImageButtonPressed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          AnimatedSwitcher(
                            duration: kThemeAnimationDuration,
                            child: _isDetailsPreviewPanelShown
                                ? ProjectDescriptionPreview(
                                    portfolioProject: widget.portfolioProject,
                                    onShowMoreDetailsPressed:
                                        _onShowMoreDetails,
                                  )
                                : AppConstants.emptySpace,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 59.0,
                      left: AppConstants.spacing24,
                      child: CloseFullScreenButton(color: Colors.white),
                    ),
                    Positioned(
                      top: 59.0,
                      right: AppConstants.spacing24,
                      child: GenericIconButton(
                        tooltipMesssage: context.l10n.fullScreenCta,
                        onPressed: () {
                          final imageAsset = widget.portfolioProject
                              .imageAssetPaths[_currentImageIndex];
                          final imageAssetPaths =
                              widget.portfolioProject.imageAssetPaths;
                          final heroTag = _createHeroTag(
                            imageAsset: imageAsset,
                            index: _currentImageIndex,
                          );
                          _showImage(
                            imageAsset: imageAsset,
                            imageAssetPaths: imageAssetPaths,
                            heroTag: heroTag,
                          );
                        },
                        icon: FontAwesomeIcons.expand,
                      ),
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

  void _toggleTitleShown(bool isTitleShown) {
    setState(() => _isDetailsPreviewPanelShown = isTitleShown);
  }

  void _updateCurrentPage() {
    if (_pageController.page == null) return;
    if (_pageController.page == _currentImageIndex.toDouble()) {
      return;
    }

    final isPageAnInteger = _pageController.page! % 1 == 0;
    final page = _pageController.page!.toInt();
    if (!isPageAnInteger) return;

    setState(() {
      _currentImageIndex = page;
    });
  }

  void _onNextImageButtonPressed() {
    if (!_showNextImageButton) return;
    _pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void _onPreviousImageButtonPressed() {
    if (!_showPreviousImageButton) return;
    _pageController.previousPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  String _createHeroTag({
    required String imageAsset,
    required int index,
  }) =>
      'image-$index-$imageAsset';

  bool get _showNextImageButton =>
      _currentImageIndex < widget.portfolioProject.imageAssetPaths.length - 1;

  bool get _showPreviousImageButton => _currentImageIndex > 0;

  bool get _shouldShowPageControls =>
      (_isDetailsPreviewPanelShown || kIsWeb) &&
      (widget.portfolioProject.imageAssetPaths.length > 1);

  void _navigateVertical(
    NavigateListVerticalDirection direction,
  ) {
    if (direction == NavigateListVerticalDirection.up) {
      _handleUpNavigation();
      return;
    }
    _handleBottomNavigation();
  }

  void _handleUpNavigation() {
    if (!_showPreviousImageButton) return;
    _pageController.previousPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void _handleBottomNavigation() {
    if (!_showNextImageButton) return;
    _pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void _onShowMoreDetails() {
    final navigator = Navigator.of(context);
    _toggleTitleShown(false);

    unawaited(
      navigator
          .pushNamed(
            ProjectDetailsPage.routeName,
            arguments: ProjectDetailsPageArguments(
              portfolioProject: widget.portfolioProject,
            ),
          )
          .then(
            (_) => _toggleTitleShown(true),
          ),
    );
  }

  void _showImage({
    required String imageAsset,
    required List<String> imageAssetPaths,
    required String heroTag,
  }) {
    final navigator = Navigator.of(context);
    final deviceWidth = context.width;

    final isMobileLayout = deviceWidth <= AppConstants.mobileLayoutMaxWidth;

    if (!isMobileLayout) {
      unawaited(
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => ImagesCarousel(
            allImageAssets: imageAssetPaths,
            initiallySelectedImageAsset: imageAsset,
          ),
        ),
      );
      return;
    }

    unawaited(
      navigator.pushNamed(
        ImageViewer.routeName,
        arguments: ImageViewerArguments(
          imageAsset: imageAsset,
          imageUrl: null,
          heroTag: heroTag,
        ),
      ),
    );
  }
}

class ProjectDescriptionPreview extends StatelessWidget {
  const ProjectDescriptionPreview({
    super.key,
    required this.portfolioProject,
    required this.onShowMoreDetailsPressed,
  });

  final PortfolioProject portfolioProject;
  final VoidCallback onShowMoreDetailsPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          onShowMoreDetailsPressed();
        }
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.85),
              Colors.black.withOpacity(0.75),
            ],
          ),
        ),
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.0,
                      child: Hero(
                        tag:
                            'project_details_${portfolioProject.imageLogoAssetPath}',
                        child: FadingAssetImage(
                          path: portfolioProject.imageLogoAssetPath,
                        ),
                      ),
                    ),
                    AppConstants.horizontalSpacing16,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            portfolioProject.title,
                            style: AppTextStyles.mediumStrong.copyWith(
                              color: Palette.white,
                            ),
                          ),
                          AppConstants.verticalSpacing4,
                          Text(
                            portfolioProject.description,
                            style: AppTextStyles.smallRegular.copyWith(
                              color: Palette.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppConstants.verticalSpacing8,
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: onShowMoreDetailsPressed,
                  child: Text(
                    context.l10n.viewMoreDetailsCta,
                    style: AppTextStyles.smallRegular.copyWith(
                      color: Palette.white,
                    ),
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
