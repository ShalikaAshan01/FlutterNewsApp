enum NewsLanguages {
  ar,
  de,
  en,
  es,
  fr,
  he,
  it,
  nl,
  no,
  pt,
  ru,
  sv,
  ud,
  none,
  zh;
}

extension NewsLanguagesExtension on NewsLanguages {
  String enumToString() {
    switch (this) {
      case NewsLanguages.ar:
        return 'Arabic';
      case NewsLanguages.de:
        return 'German';
      case NewsLanguages.en:
        return 'English';
      case NewsLanguages.es:
        return 'Spanish';
      case NewsLanguages.fr:
        return 'French';
      case NewsLanguages.he:
        return 'Hebrew';
      case NewsLanguages.it:
        return 'Italian';
      case NewsLanguages.nl:
        return 'Dutch';
      case NewsLanguages.no:
        return 'Norwegian';
      case NewsLanguages.pt:
        return 'Portuguese';
      case NewsLanguages.ru:
        return 'Russian';
      case NewsLanguages.sv:
        return 'Swedish';
      case NewsLanguages.ud:
        return 'Urdu';
      case NewsLanguages.zh:
        return 'Chinese';
      case NewsLanguages.none:
        return 'Unknown';
    }
  }
}
