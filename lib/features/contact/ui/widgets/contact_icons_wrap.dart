import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../contact.dart';

class ContactIconsWrap extends StatelessWidget {
  const ContactIconsWrap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.verticalPadding,
        top: AppConstants.verticalPadding,
        right: AppConstants.verticalPadding,
        bottom: context.bottomPadding + AppConstants.verticalPadding,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: AppConstants.horizontalPadding,
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
