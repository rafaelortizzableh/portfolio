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

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
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
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => _ImagePreview(
                        onImageSelected: _onImageSelected,
                        key: ObjectKey(
                          'image_preview_${widget.allImageAssets[index]}',
                        ),
                        imageAsset: widget.allImageAssets[index],
                        isSelectedImage:
                            selectedImageAsset == widget.allImageAssets[index],
                      ),
                      separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                      itemCount: widget.allImageAssets.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      child: Center(
        child: InkWell(
          onTap: () => onImageSelected(imageAsset),
          child: Container(
            width: 110.0,
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
