part of 'request.dart';

/// {@template lang}
/// Язык ответа и региональные особенности карты.
/// {@endtemplate}
enum Lang {
  /// ru_RU — русский
  ru,

  /// uk_UA — украинский
  uk,

  /// be_BY — белорусский
  be,

  /// en_RU — ответ на английском, российские особенности карты
  enRu,

  /// en_US — ответ на английском, американские особенности карты
  enEn,

  /// tr_TR — турецкий (только для карты Турции)
  tr,
}

extension _LangX on Lang {
  String _toLang() {
    switch (this) {
      case Lang.uk:
        return 'uk_UA';
      case Lang.be:
        return 'be_BY';
      case Lang.enRu:
        return 'en_RU';
      case Lang.enEn:
        return 'en_US';
      case Lang.tr:
        return 'tr_TR';
      case Lang.ru:
      default:
        return 'ru_RU';
    }
  }
}
