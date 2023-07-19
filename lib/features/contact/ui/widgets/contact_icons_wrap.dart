import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../contact.dart';

class ContactIconsWrap extends StatelessWidget {
  const ContactIconsWrap({
    super.key,
    this.direction = Axis.horizontal,
  });

  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.spacing12,
        top: AppConstants.spacing12,
        right: AppConstants.spacing12,
        bottom: context.bottomPadding + AppConstants.spacing12,
      ),
      child: Wrap(
        direction: direction,
        alignment: WrapAlignment.center,
        spacing: AppConstants.spacing12,
        runSpacing: AppConstants.spacing12,
        children: ContactInformationData.contactIconsAndLinks
            .map(
              (contactIconAndLink) => ContactIcon(
                contactIconAndLink: contactIconAndLink,
              ),
            )
            .toList(),
      ),
    );
  }
}
