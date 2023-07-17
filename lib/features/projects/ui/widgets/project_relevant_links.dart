import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/core.dart';

class ProjectRelevantLinks extends StatelessWidget {
  const ProjectRelevantLinks({
    super.key,
    this.website,
    this.playStoreUrl,
    this.appStoreUrl,
    this.youtubeDemoUrl,
  });

  final Uri? website;
  final Uri? playStoreUrl;
  final Uri? appStoreUrl;
  final Uri? youtubeDemoUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (website != null) ...[
          AppConstants.horizontalSpacing4,
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.link,
              color: Palette.white,
            ),
            onPressed: () {
              launchUrl(
                website!,
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
        if (youtubeDemoUrl != null) ...[
          AppConstants.horizontalSpacing4,
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.youtube,
              color: Palette.white,
            ),
            onPressed: () {
              launchUrl(
                youtubeDemoUrl!,
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
        if (appStoreUrl != null) ...[
          AppConstants.horizontalSpacing4,
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.appStore,
              color: Palette.white,
            ),
            onPressed: () {
              launchUrl(
                appStoreUrl!,
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
        if (playStoreUrl != null) ...[
          AppConstants.horizontalSpacing4,
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.googlePlay,
              color: Palette.white,
            ),
            onPressed: () {
              launchUrl(
                playStoreUrl!,
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
      ],
    );
  }
}
