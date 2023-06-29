import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../core.dart';

class ImageViewerArguments {
  const ImageViewerArguments({
    this.imageUrl,
    this.imageAsset,
    required this.heroTag,
  }) : assert(
          imageAsset != null || imageUrl != null,
          'One of Image Asset or Image Url should be a valid string',
        );
  final String? imageUrl, imageAsset;
  final String heroTag;
}

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
    required this.imageUrl,
    required this.imageAsset,
    required this.heroTag,
  });
  static const routeName = 'image-viewer';

  final String? imageUrl;
  final String? imageAsset;
  final String heroTag;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer>
    with SingleTickerProviderStateMixin {
  late final TransformationController _transformationController;
  late final AnimationController _animationController;
  Animation? _animation;
  TapDownDetails? _tapDownDetails;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animationController.addListener(_animateOnDoubleTap);
  }

  @override
  void dispose() {
    _animationController.removeListener(_animateOnDoubleTap);
    _animationController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWrapper(
      statusBarStyle: StatusBarStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Palette.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Palette.white,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Center(
              child: GestureDetector(
                onDoubleTapDown: (details) => _handleDoubleTapDown(
                  details,
                ),
                onDoubleTap: () => _handleDoubleTap(
                  _transformationController,
                  _animationController,
                ),
                child: InteractiveViewer(
                  transformationController: _transformationController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: widget.heroTag,
                          child: _Image(
                            key: ObjectKey(
                              'image-viewer-${widget.imageUrl}-${widget.imageAsset}}',
                            ),
                            imageAsset: widget.imageAsset,
                            imageUrl: widget.imageUrl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleDoubleTapDown(
    TapDownDetails details,
  ) {
    _tapDownDetails = details;
    setState(() {});
  }

  void _animateOnDoubleTap() {
    final animation = _animation;
    if (animation == null) return;
    _transformationController.value = animation.value;
  }

  void _handleDoubleTap(
    TransformationController transformationController,
    AnimationController animationController,
  ) {
    final details = _tapDownDetails;
    if (details == null) return;

    final endMatrix = Matrix4.identity();
    final currentTransformationValue = transformationController.value;

    _handlePositionChangesOnEndMatrix(
      endMatrix: endMatrix,
      currentTransformationControllerValue: currentTransformationValue,
      details: details,
    );

    _updateAnimation(
      animationController: animationController,
      endMatrix: endMatrix,
      currentTransformationControllerValue: currentTransformationValue,
    );

    animationController.forward(from: 0);
  }

  void _handlePositionChangesOnEndMatrix({
    required Matrix4 endMatrix,
    required Matrix4 currentTransformationControllerValue,
    required TapDownDetails details,
  }) {
    final position = details.localPosition;
    if (currentTransformationControllerValue == endMatrix) return;

    endMatrix
      ..translate(-position.dx, -position.dy)
      ..scale(2.0);
  }

  void _updateAnimation({
    required Matrix4 endMatrix,
    required Matrix4 currentTransformationControllerValue,
    required AnimationController animationController,
  }) {
    setState(() {
      _animation = Matrix4Tween(
        begin: currentTransformationControllerValue,
        end: endMatrix,
      ).animate(
        CurveTween(curve: Curves.easeOut).animate(animationController),
      );
    });
  }
}

class _Image extends StatelessWidget {
  const _Image({
    super.key,
    required this.imageAsset,
    required this.imageUrl,
  });
  final String? imageAsset;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return CachedNetworkImage(
        width: context.width,
        imageUrl: imageUrl!,
      );
    }
    if (imageAsset != null) {
      return Image.asset(imageAsset!);
    }
    return const SizedBox.expand();
  }
}
