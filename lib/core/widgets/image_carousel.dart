import 'package:flutter/material.dart';

import '../core.dart';

class ImagesCarousel extends StatefulWidget {
  const ImagesCarousel({
    super.key,
    required this.initiallySelectedImageAsset,
    required this.allImageAssets,
  });
  final String initiallySelectedImageAsset;
  final List<String> allImageAssets;

  @override
  State<ImagesCarousel> createState() => _ImagesCarouselState();
}

class _ImagesCarouselState extends State<ImagesCarousel> {
  late String selectedImageAsset = widget.initiallySelectedImageAsset;
  late FocusNode focusNode;
  late final ScrollController _imageSliderScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _imageSliderScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.black54,
        ),
        child: GestureDetector(
          // Adding a GestureDetector to dismiss
          // the dialog when tapping outside of it.
          //
          // Note: This is done so we can prevent the default barrier
          // behavior of the [showDialog] function.
          behavior: HitTestBehavior.opaque,
          onTap: Navigator.of(context).pop,
          child: GestureDetector(
            // Adding another GestureDetector to prevent
            // the dialog from being dismissed
            // when tapping inside of it.
            onTap: () {},
            child: Center(
              child: Padding(
                padding: AppConstants.padding32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              selectedImageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            right: 0,
                            child: CloseFullScreenButton(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    FocusableActionDetector(
                      focusNode: focusNode,
                      onFocusChange: (_) => focusNode.requestFocus(),
                      shortcuts: ShortcutIntents.navigateHorizontal(
                        onNavigate: (direction) {
                          _navigateHorizontal(direction);
                        },
                      ),
                      actions: ShortcutActions.navigateHorizontal,
                      child: SizedBox(
                        height: 80.0,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          controller: _imageSliderScrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final imageAsset = widget.allImageAssets[index];
                            return _ImagePreview(
                              onImageSelected: _onImageSelected,
                              key: _generateObjectKey(imageAsset),
                              imageAsset: imageAsset,
                              isSelectedImage: selectedImageAsset ==
                                  widget.allImageAssets[index],
                            );
                          },
                          separatorBuilder: (_, __) =>
                              AppConstants.horizontalSpacing8,
                          itemCount: widget.allImageAssets.length,
                        ),
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

  static Key _generateObjectKey(
    String imageAsset,
  ) =>
      Key('image_preview_$imageAsset');

  void _navigateHorizontal(
    NavigateListHorizonalDirection direction,
  ) {
    if (direction == NavigateListHorizonalDirection.left) {
      _handleLeftNavigation();
      return;
    }
    _handleRightNavigation();
  }

  void _handleLeftNavigation() {
    final currentItem = widget.allImageAssets.indexOf(selectedImageAsset);
    if (currentItem == 0) {
      return;
    }
    final newItem = currentItem - 1;
    final newImage = widget.allImageAssets[newItem];
    _onImageSelected(newImage);
  }

  void _handleRightNavigation() {
    final currentItem = widget.allImageAssets.indexOf(selectedImageAsset);
    if (currentItem == widget.allImageAssets.length - 1) {
      return;
    }
    final newItem = currentItem + 1;
    final newImage = widget.allImageAssets[newItem];
    _onImageSelected(newImage);
  }

  void _onImageSelected(String imageAsset) {
    setState(() {
      selectedImageAsset = imageAsset;
    });
    _animateToImage(imageAsset);
  }

  void _animateToImage(String imageAsset) {
    final index = widget.allImageAssets.indexOf(imageAsset);
    final offset = index * _ImagePreview._imageWidth;
    _imageSliderScrollController.animateTo(
      offset,
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }
}

class _ImagePreview extends StatelessWidget {
  const _ImagePreview({
    super.key,
    required this.imageAsset,
    required this.isSelectedImage,
    required this.onImageSelected,
  });

  final bool isSelectedImage;
  final String imageAsset;
  final Function(String) onImageSelected;

  static const _imageWidth = 110.0;

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      child: Center(
        child: InkWell(
          onTap: () => onImageSelected(imageAsset),
          child: Container(
            width: _imageWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: isSelectedImage ? Colors.white : Colors.transparent,
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                isSelectedImage ? 6.0 : 8.0,
              ),
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                width: 110.0,
                height: 80.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
