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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => unawaited(launchUrl(
          contactIconAndLink.url,
          mode: LaunchMode.externalApplication,
        )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            color: Palette.black,
          ),
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            contactIconAndLink.icon,
            color: Palette.white,
          ),
        ),
      ),
    );
  }
}
