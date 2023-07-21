import 'dart:async';

import 'package:flutter/widgets.dart';

Future<void> preloadAssetImages(BuildContext context) async {
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
