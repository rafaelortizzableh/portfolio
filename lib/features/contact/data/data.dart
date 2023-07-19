import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

typedef ContactIconAndLinkRecord = ({IconData icon, Uri url});

abstract class ContactInformationData {
  static const _githubLink = String.fromEnvironment('GITHUB_LINK');
  static const _linkedinLink = String.fromEnvironment('LINKEDIN_LINK');
  static const _emailLink = String.fromEnvironment('EMAIL_LINK');
  static const _phoneLink = String.fromEnvironment('PHONE_LINK');
  static const _twitterLink = String.fromEnvironment('TWITTER_LINK');

  static final ContactIconAndLinkRecord _github = (
    icon: FeatherIcons.github,
    url: Uri.parse(_githubLink),
  );

  static final ContactIconAndLinkRecord _linkedin = (
    icon: FeatherIcons.linkedin,
    url: Uri.parse(_linkedinLink),
  );

  static final ContactIconAndLinkRecord _email = (
    icon: FeatherIcons.mail,
    url: Uri.parse(_emailLink),
  );

  static final ContactIconAndLinkRecord _phone = (
    icon: FeatherIcons.phone,
    url: Uri.parse(_phoneLink),
  );

  static final ContactIconAndLinkRecord _twitter = (
    icon: FeatherIcons.twitter,
    url: Uri.parse(_twitterLink),
  );

  static final Set<ContactIconAndLinkRecord> contactIconsAndLinks = {
    _linkedin,
    _github,
    _twitter,
    _email,
    _phone,
  };
}
