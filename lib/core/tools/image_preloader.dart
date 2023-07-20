import 'dart:async';

import 'package:flutter/material.dart';

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

  await Future.wait(precacheFutures);
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
    return Material(
      child: FutureBuilder<void>(
          future: _precacheFuture,
          builder: (context, snapshot) {
            return snapshot.when(
              data: (_) => widget.child,
              error: (e, __) => Center(
                child: Text(
                  'Error:'
                  '${e.toString()}',
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }),
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
