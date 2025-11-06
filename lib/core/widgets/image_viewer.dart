import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

import '../core.dart';

class ImageViewerArguments {
  const ImageViewerArguments({
    this.imageUrl,
    this.imageAsset,
    required this.heroTag,
  }) : assert(
         imageAsset != null || imageUrl != null,
         'One of imageAsset or imageUrl should be a valid string',
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
    with TickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
  );
  late final _transformationController = TransformationController();
  final _tapDownDetailsNotifier = ValueNotifier<TapDownDetails?>(null);
  final _animationNotifier = ValueNotifier<Animation?>(null);

  @override
  void initState() {
    super.initState();
    _animationController.addListener(
      () => _animateOnDoubleTap(
        _transformationController,
        _animationNotifier.value,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _transformationController.dispose();
    _tapDownDetailsNotifier.dispose();
    _animationNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = _transformationController;
    final animationController = _animationController;
    return SizedBox.expand(
      child: ColoredBox(
        color: Colors.black,
        child: StatusBarWrapper(
          statusBarStyle: StatusBarStyle.light,
          child: SafeArea(
            bottom: false,
            top: true,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  Center(
                    child: GestureDetector(
                      onDoubleTapDown: (details) => _handleDoubleTapDown(
                        details,
                        _tapDownDetailsNotifier,
                      ),
                      onDoubleTap: () => _handleDoubleTap(
                        transformationController,
                        animationController,
                        _tapDownDetailsNotifier.value,
                        _animationNotifier,
                      ),
                      child: InteractiveViewer(
                        transformationController: transformationController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Hero(
                                tag: widget.heroTag,
                                transitionOnUserGestures: true,
                                child: _Image(
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
                  const Positioned(
                    top: kToolbarHeight,
                    child: CloseFullScreenButton(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleDoubleTapDown(
    TapDownDetails details,
    ValueNotifier<TapDownDetails?> tapDownDetailsValueNotifier,
  ) {
    tapDownDetailsValueNotifier.value = details;
  }

  void _animateOnDoubleTap(
    TransformationController transformationController,
    Animation? animation,
  ) {
    if (animation == null) return;
    transformationController.value = animation.value;
  }

  void _handleDoubleTap(
    TransformationController transformationController,
    AnimationController animationController,
    TapDownDetails? details,
    ValueNotifier<Animation?> animationValueNotifier,
  ) {
    if (details == null) return;

    Matrix4? endMatrix;

    if (transformationController.value != Matrix4.identity()) {
      endMatrix = Matrix4.identity();
    } else {
      final position = details.localPosition;

      endMatrix = Matrix4.identity()
        ..translateByVector3(Vector3(-position.dx, -position.dy, 0.0))
        ..scaleByVector3(Vector3(2.0, 2.0, 1.0));
    }
    animationValueNotifier.value = Matrix4Tween(
      begin: transformationController.value,
      end: endMatrix,
    ).animate(CurveTween(curve: Curves.easeOut).animate(animationController));
    animationController.forward(from: 0);
  }
}

class _Image extends StatelessWidget {
  const _Image({required this.imageAsset, required this.imageUrl});
  final String? imageAsset;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    if (imageUrl != null) {
      return CachedNetworkImage(width: context.width, imageUrl: imageUrl);
    }
    if (imageAsset != null) {
      return Image.asset(imageAsset!);
    }
    return const SizedBox.expand();
  }
}
