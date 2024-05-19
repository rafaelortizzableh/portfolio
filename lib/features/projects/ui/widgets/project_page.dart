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
                          physics: const ClampingScrollPhysics(),
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
                          ImageControls(
                            shouldShowNextImageButton: _showNextImageButton,
                            shouldShowPreviousImageButton:
                                _showPreviousImageButton,
                            onNextImageButtonPressed: _onNextImageButtonPressed,
                            onPreviousImageButtonPressed:
                                _onPreviousImageButtonPressed,
                            shouldShowPageControls: _shouldShowPageControls,
                            projectTitle: widget.portfolioProject.title,
                          ),
                          AnimatedOpacity(
                            opacity: _isDetailsPreviewPanelShown ? 1 : 0,
                            duration: kThemeAnimationDuration,
                            child: IgnorePointer(
                              ignoring: !_isDetailsPreviewPanelShown,
                              child: ProjectDescriptionPreview(
                                portfolioProject: widget.portfolioProject,
                                onShowMoreDetailsPressed: _onShowMoreDetails,
                              ),
                            ),
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
                          _onShowImage(
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

    final isWithinMobileFrame =
        DeviceWrapperModel.isWithinDeviceFrameOf(context);

    if (isWithinMobileFrame) {
      showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          barrierColor: Colors.transparent,
          backgroundColor: Colors.black.withOpacity(0.2),
          shape: const RoundedRectangleBorder(
            borderRadius: AppConstants.verticalRadius12,
          ),
          builder: (context) {
            return ClipRRect(
              borderRadius: AppConstants.verticalRadius12,
              child: FractionallySizedBox(
                heightFactor: 0.95,
                child: ProjectDetailsFullScreenDialog(
                  portfolioProject: widget.portfolioProject,
                ),
              ),
            );
          }).then((_) => _toggleTitleShown(true));
      return;
    }

    unawaited(navigator
        .pushNamed(
          ProjectDetailsPage.routeName,
          arguments: ProjectDetailsPageArguments(
            portfolioProject: widget.portfolioProject,
          ),
        )
        .then((_) => _toggleTitleShown(true)));
  }

  void _onShowImage({
    required String imageAsset,
    required List<String> imageAssetPaths,
    required String heroTag,
  }) {
    final navigator = Navigator.of(context);

    final isWithinMobileFrame =
        DeviceWrapperModel.isWithinDeviceFrameOf(context);

    if (isWithinMobileFrame) {
      unawaited(
        showDialog(
          barrierDismissible: true,
          context: context,
          useRootNavigator: true,
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
