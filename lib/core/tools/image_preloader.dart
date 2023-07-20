import 'dart:async';

import 'package:flutter/material.dart';

import '../core.dart';

Future<void> _preloadAssetImages(BuildContext context) async {
  const imagePaths = [
    'assets/images/header.webp',
    'assets/icons/email_icon.webp',
    'assets/icons/github_icon.webp',
    'assets/icons/linkedin_icon.webp',
    'assets/icons/info_icon.webp',
    'assets/icons/phone_icon.webp',
    'assets/icons/twitter_icon.webp',
    'assets/images/profile_picture.webp',
    'assets/images/tech_tools/aws.webp',
    'assets/images/tech_tools/docker.webp',
    'assets/images/tech_tools/firebase.webp',
    'assets/images/tech_tools/flutter.webp',
    'assets/images/tech_tools/go.webp',
    'assets/images/tech_tools/google_cloud.webp',
    'assets/images/tech_tools/node.webp',
    'assets/images/tech_tools/postgres.webp',
    'assets/images/tech_tools/react.webp',
    'assets/images/tech_tools/redis.webp',
    'assets/images/tech_tools/serverpod.webp',
    'assets/images/tech_tools/wordpress.webp',
  ];

  final imageProviders = imagePaths.map(
    (assetName) => AssetImage(assetName),
  );

  final precacheFutures = imageProviders.map(
    (imageProvider) => precacheImage(imageProvider, context),
  );

  await Future.wait(
    precacheFutures,
  );
}

class ImagePreloader extends StatefulWidget {
  const ImagePreloader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ImagePreloader> createState() => _ImagePreloaderState();
}

class _ImagePreloaderState extends State<ImagePreloader> {
  late final Future<void> _precacheFuture = _preloadAssetImages(context);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        child: FutureBuilder<void>(
          future: _precacheFuture,
          builder: (context, snapshot) {
            return Stack(
              children: [
                snapshot.when(
                  data: (_) => _SplashAnimationWrapper(child: widget.child),
                  error: (e, __) => Center(
                    child: Text(
                      'Error:\n'
                      '${e.toString()}',
                      style: AppTextStyles.mediumStrong.copyWith(
                        color: Palette.white,
                      ),
                    ),
                  ),
                  loading: () => Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: AppConstants.padding12,
                      child: Theme(
                          data: ThemeData(
                            progressIndicatorTheme:
                                const ProgressIndicatorThemeData(
                              color: Palette.black,
                            ),
                          ),
                          child: const CircularProgressIndicator()),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SplashAnimationWrapper extends StatefulWidget {
  const _SplashAnimationWrapper({
    // ignore: unused_element
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<_SplashAnimationWrapper> createState() =>
      _SplashAnimationWrapperState();
}

class _SplashAnimationWrapperState extends State<_SplashAnimationWrapper>
    with SingleTickerProviderStateMixin {
  static const _animationDuration = Duration(milliseconds: 1500);
  late final AnimationController _animationController;
  // staggered animation for opacity. Makes the splash screen fade in after the animation controller gets to 50%.
  late final _opacityAnimation = CurvedAnimation(
    parent: _animationController,
    curve: const Interval(
      0.0,
      0.17,
      curve: Curves.easeIn,
    ),
  );

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(_) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, -1.0),
        end: Offset.zero,
      )
          .chain(
            CurveTween(curve: Sprung.criticallyDamped),
          )
          .animate(_animationController),
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: widget.child,
      ),
    );
  }
}

extension WhenExtension<T> on AsyncSnapshot<T?> {
  Widget when({
    required Widget Function(T? data) data,
    required Widget Function(Object? error, StackTrace? stackTrace) error,
    required Widget Function() loading,
  }) {
    if (connectionState == ConnectionState.waiting) return loading();
    if (hasError) return error(error, stackTrace);
    return data(this.data);
  }
}
