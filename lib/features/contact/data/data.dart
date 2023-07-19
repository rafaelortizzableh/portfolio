import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef ContactIconAndLinkRecord = ({PhosphorIconData icon, Uri url});

abstract class ContactInformationData {
  static const _githubLink = String.fromEnvironment('GITHUB_LINK');
  static const _linkedinLink = String.fromEnvironment('LINKEDIN_LINK');
  static const _emailLink = String.fromEnvironment('EMAIL_LINK');
  static const _phoneLink = String.fromEnvironment('PHONE_LINK');
  static const _twitterLink = String.fromEnvironment('TWITTER_LINK');

  static final ContactIconAndLinkRecord _github = (
    icon: PhosphorIcons.fill.githubLogo,
    url: Uri.parse(_githubLink),
  );

  static final ContactIconAndLinkRecord _linkedin = (
    icon: PhosphorIcons.fill.linkedinLogo,
    url: Uri.parse(_linkedinLink),
  );

  static final ContactIconAndLinkRecord _email = (
    icon: PhosphorIcons.fill.envelope,
    url: Uri.parse(_emailLink),
  );

  static final ContactIconAndLinkRecord _phone = (
    icon: PhosphorIcons.fill.phone,
    url: Uri.parse(_phoneLink),
  );

  static final ContactIconAndLinkRecord _twitter = (
    icon: PhosphorIcons.fill.twitterLogo,
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
