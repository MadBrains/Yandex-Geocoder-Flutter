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
  String _toLang() => switch(this) {
    Lang.uk => 'uk_UA',
    Lang.be => 'be_BY',
    Lang.enRu => 'en_RU',
    Lang.enEn => 'en_US',
    Lang.tr => 'tr_TR',
    Lang.ru => 'ru_RU'
  };
}
