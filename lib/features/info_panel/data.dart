import '../../core/core.dart';

typedef LanguageRecord = ({String language, double level});

class Language {
  const Language({
    required this.language,
    required this.level,
  });

  final String language;
  final double level;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Language &&
        other.language == language &&
        other.level == level;
  }

  @override
  int get hashCode => language.hashCode ^ level.hashCode;
}

abstract class InfoPanelData {
  static Set<Language> getLanguageRecords(AppLocalizations l10n) {
    return {
      Language(language: l10n.english, level: 1.0),
      Language(language: l10n.spanish, level: 1.0),
      Language(language: l10n.catalan, level: 0.75),
      Language(language: l10n.italian, level: 0.66),
    };
  }
}
