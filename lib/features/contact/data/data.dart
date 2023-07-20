typedef ContactIconAndLinkRecord = ({String iconAsset, Uri url});

abstract class ContactInformationData {
  static const _githubLink = String.fromEnvironment('GITHUB_LINK');
  static const _linkedinLink = String.fromEnvironment('LINKEDIN_LINK');
  static const _emailLink = String.fromEnvironment('EMAIL_LINK');
  static const _phoneLink = String.fromEnvironment('PHONE_LINK');
  static const _twitterLink = String.fromEnvironment('TWITTER_LINK');

  static final ContactIconAndLinkRecord _github = (
    iconAsset: 'assets/icons/github_icon.webp',
    url: Uri.parse(_githubLink),
  );

  static final ContactIconAndLinkRecord _linkedin = (
    iconAsset: 'assets/icons/linkedin_icon.webp',
    url: Uri.parse(_linkedinLink),
  );

  static final ContactIconAndLinkRecord _email = (
    iconAsset: 'assets/icons/email_icon.webp',
    url: Uri.parse(_emailLink),
  );

  static final ContactIconAndLinkRecord _phone = (
    iconAsset: 'assets/icons/phone_icon.webp',
    url: Uri.parse(_phoneLink),
  );

  static final ContactIconAndLinkRecord _twitter = (
    iconAsset: 'assets/icons/twitter_icon.webp',
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
