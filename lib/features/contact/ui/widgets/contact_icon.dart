import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/core.dart';
import '../../contact.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({
    super.key,
    required this.contactIconAndLink,
  });

  final ContactIconAndLinkRecord contactIconAndLink;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      shape: const RoundedRectangleBorder(
        borderRadius: AppConstants.borderRadius16,
      ),
      backgroundColor: Palette.black,
      onPressed: _launchUrl,
      child: Padding(
        padding: AppConstants.padding8,
        child: GenericAssetIconWidget(
          iconAsset: contactIconAndLink.iconAsset,
        ),
      ),
    );
  }

  void _launchUrl() {
    unawaited(launchUrl(
      contactIconAndLink.url,
      mode: LaunchMode.externalApplication,
    ));
  }
}
