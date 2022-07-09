enum NewsCountry {
  ae,
  ar,
  at,
  au,
  be,
  bg,
  br,
  ca,
  ch,
  cn,
  co,
  cu,
  cz,
  de,
  eg,
  fr,
  gb,
  gr,
  hk,
  hu,
  id,
  ie,
  il,
  it,
  jp,
  kr,
  lt,
  lv,
  ma,
  mx,
  my,
  ng,
  nl,
  no,
  nz,
  ph,
  pl,
  pt,
  ro,
  rs,
  ru,
  sa,
  se,
  sg,
  si,
  sk,
  th,
  tr,
  tw,
  ua,
  us,
  ve,
  za,
  none
}

extension NewsCountryExtension on NewsCountry {
  String enumToString() {
    switch (this) {
      case NewsCountry.ae:
        return 'United Arab Emirates';
      case NewsCountry.ar:
        return 'Argentina';
      case NewsCountry.at:
        return 'Austria';
      case NewsCountry.au:
        return 'Australia';
      case NewsCountry.be:
        return 'Belgium';
      case NewsCountry.bg:
        return 'Bulgaria';
      case NewsCountry.br:
        return 'Brazil';
      case NewsCountry.ca:
        return 'Canada';
      case NewsCountry.ch:
        return 'Switzerland';
      case NewsCountry.cn:
        return 'China';

      case NewsCountry.co:
        return 'Colombia';

      case NewsCountry.cu:
        return 'Cuba';

      case NewsCountry.cz:
        return 'Czechia';

      case NewsCountry.de:
        return 'Germany';

      case NewsCountry.eg:
        return 'Egypt';

      case NewsCountry.fr:
        return 'France';

      case NewsCountry.gb:
        return 'United Kingdom';

      case NewsCountry.gr:
        return 'Greece';

      case NewsCountry.hk:
        return 'Hong Kong';

      case NewsCountry.hu:
        return 'Hungary';

      case NewsCountry.id:
        return 'Indonesia';

      case NewsCountry.ie:
        return 'Ireland';

      case NewsCountry.il:
        return 'Israel';
      case NewsCountry.it:
        return 'Italy';

      case NewsCountry.jp:
        return 'Japan';

      case NewsCountry.kr:
        return 'Republic of Korea';

      case NewsCountry.lt:
        return 'Lithuania';

      case NewsCountry.lv:
        return 'Latvia';

      case NewsCountry.ma:
        return 'Morocco';

      case NewsCountry.mx:
        return 'Mexico';

      case NewsCountry.my:
        return 'Malaysia';

      case NewsCountry.ng:
        return 'Nigeria';

      case NewsCountry.nl:
        return 'Netherlands';

      case NewsCountry.no:
        return 'Norway';

      case NewsCountry.nz:
        return 'New Zealand';

      case NewsCountry.ph:
        return 'Philippines';

      case NewsCountry.pl:
        return 'Poland';

      case NewsCountry.pt:
        return 'Portugal';

      case NewsCountry.ro:
        return 'Romania';

      case NewsCountry.rs:
        return 'Serbia';

      case NewsCountry.ru:
        return 'Russia';

      case NewsCountry.sa:
        return 'Saudi Arabia';

      case NewsCountry.se:
        return 'Sweden';

      case NewsCountry.sg:
        return 'Singapore';

      case NewsCountry.si:
        return 'Slovenia';

      case NewsCountry.sk:
        return 'Slovakia';

      case NewsCountry.th:
        return 'Thailand';

      case NewsCountry.tr:
        return 'Türkiye';

      case NewsCountry.tw:
        return 'Taiwan';

      case NewsCountry.ua:
        return 'Ukraine';

      case NewsCountry.us:
        return 'United States';

      case NewsCountry.ve:
        return 'Venezuela';

      case NewsCountry.za:
        return 'South Africa';
      case NewsCountry.none:
        return 'Unknown';
    }
  }
}
