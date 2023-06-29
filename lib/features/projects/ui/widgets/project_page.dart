import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

typedef PortfolioProject = ({
  String title,
  String description,
  String imageLogoAssetPath,
  String featuredImageAssetPath,
  List<String> imageAssetPaths,
  Uri? website,
  Uri? playStoreUrl,
  Uri? appStoreUrl
});

class ProjectPage extends StatefulWidget {
  const ProjectPage({
    super.key,
    required this.portfolioProject,
    this.minWidth,
    this.backgroundDecoration = const BoxDecoration(
      color: Palette.black,
    ),
  });

  final PortfolioProject portfolioProject;
  final double? minWidth;
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

  bool _isTitleShown = true;
  int _currentImageIndex = 0;
  bool _shouldShowFullDescription = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
    _focusNode = FocusNode()..requestFocus();
    unawaited(_automaticallyHideTitleAfterDelay());
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

  Future<void> _automaticallyHideTitleAfterDelay() async {
    await Future.delayed(const Duration(seconds: 5));
    if (!mounted) return;
    if (!_isTitleShown) return;

    _toggleTitleShown(false);
  }

  void _toggleTitleShown(bool isTitleShown) {
    setState(() => _isTitleShown = isTitleShown);
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

  @override
  Widget build(BuildContext context) {
    final minWidth = widget.minWidth ?? context.width;

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
            shortcuts: ShortcutIntents.navigateVertical(
              onNavigate: (direction) {
                _navigateVertical(direction);
              },
            ),
            actions: ShortcutActions.navigateVertical,
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
                      onTap: () => _toggleTitleShown(!_isTitleShown),
                      child: SizedBox(
                        child: PageView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              widget.portfolioProject.imageAssetPaths.length,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            final imageAsset =
                                widget.portfolioProject.imageAssetPaths[index];
                            final heroTag = 'image-$index-$imageAsset';

                            return _PorfolioImage(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        if (_shouldShowPageControls) ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (_showPreviousImageButton) ...[
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GenericIconButton(
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: kThemeAnimationDuration,
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    icon: CupertinoIcons.arrow_up_circle,
                                  ),
                                ),
                              ],
                              if (_showNextImageButton) ...[
                                const SizedBox(
                                  height: AppConstants.verticalPadding / 3,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GenericIconButton(
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration: kThemeAnimationDuration,
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    icon: CupertinoIcons.arrow_down_circle,
                                  ),
                                ),
                              ],
                              const SizedBox(
                                height: AppConstants.verticalPadding,
                              ),
                            ],
                          ),
                        ],
                        AnimatedContainer(
                          duration: kThemeAnimationDuration,
                          decoration: _isTitleShown
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.85),
                                      Colors.black.withOpacity(0.25),
                                    ],
                                  ),
                                )
                              : const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 26.0,
                              right: 26.0,
                              top: 33.0,
                              bottom: 49.0,
                            ),
                            child: AnimatedOpacity(
                              duration: kThemeAnimationDuration,
                              opacity: _isTitleShown ? 1.0 : 0.0,
                              child: GestureDetector(
                                onTap: !_isTitleShown
                                    ? () => _toggleTitleShown(true)
                                    : null,
                                child: AbsorbPointer(
                                  absorbing: !_isTitleShown,
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.portfolioProject.title,
                                        style:
                                            AppTextStyles.mediumStrong.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0,
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                      ),
                                      const SizedBox(height: 13.0),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 50.0,
                                                child: FadingAssetImage(
                                                  path: widget.portfolioProject
                                                      .imageLogoAssetPath,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width:
                                                AppConstants.horizontalPadding,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: InkWell(
                                                onTap: () => setState(
                                                  () => _shouldShowFullDescription =
                                                      !_shouldShowFullDescription,
                                                ),
                                                child: Text(
                                                  widget.portfolioProject
                                                      .description,
                                                  textAlign: TextAlign.left,
                                                  style: AppTextStyles
                                                      .smallRegular
                                                      .copyWith(
                                                    color: Colors.white,
                                                  ),
                                                  maxLines:
                                                      !_shouldShowFullDescription
                                                          ? 2
                                                          : 20,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppConstants.verticalPadding,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: ProjectRelevantLinks(
                                          appStoreUrl: widget
                                              .portfolioProject.appStoreUrl,
                                          playStoreUrl: widget
                                              .portfolioProject.playStoreUrl,
                                          website:
                                              widget.portfolioProject.website,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      top: 59.0,
                      left: 26.0,
                      child: CloseFullScreenButton(color: Colors.white),
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

  bool get _showNextImageButton =>
      _currentImageIndex < widget.portfolioProject.imageAssetPaths.length - 1;

  bool get _showPreviousImageButton => _currentImageIndex > 0;

  bool get _shouldShowPageControls =>
      (_isTitleShown || kIsWeb) &&
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
}

class _PorfolioImage extends StatelessWidget {
  const _PorfolioImage({
    required this.heroTag,
    required this.imageAsset,
    required this.imageAssetPaths,
  });

  final String heroTag;
  final String imageAsset;
  final List<String> imageAssetPaths;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: heroTag,
          child: FadingAssetImage(
            path: imageAsset,
          ),
        ),
        Positioned(
          right: AppConstants.horizontalPadding,
          child: GenericIconButton(
            onPressed: () => _showImage(context),
            icon: FontAwesomeIcons.expand,
          ),
        ),
      ],
    );
  }

  void _showImage(BuildContext context) {
    final deviceWidth = context.width;
    final navigator = Navigator.of(context);
    if (deviceWidth > AppConstants.mobileLayoutMaxWidth) {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => ImagesCarousel(
          allImageAssets: imageAssetPaths,
          initiallySelectedImageAsset: imageAsset,
        ),
      );
      return;
    }

    final imageViewerRoute = MaterialPageRoute(
      builder: (context) => ImageViewer(
        imageAsset: imageAsset,
        imageUrl: null,
        heroTag: heroTag,
      ),
    );

    navigator.push(imageViewerRoute);
  }
}
