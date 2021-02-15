part of 'request.dart';

/// {@template geocode_request}
/// Модель запроса на геокодирования
/// {@endtemplate}
class GeocodeRequest with Comparer {
  /// {@macro geocode_request}
  factory GeocodeRequest({
    @required Geocode geocode,
    KindRequest kind,
    bool rspn,
    SearchAreaLL ll,
    SearchAreaSPN spn,
    SearchAreaBBOX bbox,
    int results,
    int skip,
    Lang lang,
  }) =>
      GeocodeRequest._(
        geocode: geocode,
        kind: kind,
        rspn: rspn,
        ll: ll,
        spn: spn,
        bbox: bbox,
        results: results,
        skip: skip,
        lang: lang,
      );

  /// Используется для явного указания ключа
  ///
  /// {@macro geocode_request}
  factory GeocodeRequest.withKey({
    @required String apiKey,
    @required Geocode geocode,
    KindRequest kind,
    bool rspn,
    SearchAreaLL ll,
    SearchAreaSPN spn,
    SearchAreaBBOX bbox,
    int results,
    int skip,
    Lang lang,
  }) =>
      GeocodeRequest._(
        apiKey: apiKey,
        geocode: geocode,
        kind: kind,
        rspn: rspn,
        ll: ll,
        spn: spn,
        bbox: bbox,
        results: results,
        skip: skip,
        lang: lang,
      );

  GeocodeRequest._({
    @required this.geocode,
    this.apiKey,
    this.kind,
    this.rspn,
    this.ll,
    this.spn,
    this.bbox,
    this.results,
    this.skip,
    this.lang,
  });

  /// {@macro geocode}
  final Geocode geocode;

  /// Ключ, полученный в Кабинете разработчика
  final String apiKey;

  /// {@macro kind_request}
  final KindRequest kind;

  /// Флаг, задающий ограничение поиска указанной областью.
  /// Область задается параметрами [ll] и [spn] либо [bbox].
  ///
  /// Возможные значения:
  /// - [false] — не ограничивать поиск,
  /// - [true] — ограничивать поиск.
  final bool rspn;

  /// {@macro search_area_ll}
  final SearchAreaLL ll;

  /// {@macro search_area_spn}
  final SearchAreaSPN spn;

  /// {@macro search_area_bbox}
  final SearchAreaBBOX bbox;

  /// Максимальное количество возвращаемых объектов.
  ///
  /// Если указан параметр [skip] то значение нужно задать явно.
  ///
  /// Максимальное допустимое значение: 100.
  final int results;

  /// Количество пропускаемых объектов в ответе, начиная с первого.
  ///
  /// Если указано, нужно также задать значение [results].
  /// Значение [skip] должно нацело делиться на значение [results].
  final int skip;

  /// {@macro lang}
  final Lang lang;

  @override
  Map<String, Object> get equals => <String, Object>{
        kGeocode: geocode,
        kApiKey: apiKey,
        kKind: kind,
        kRspn: rspn,
        kLl: ll,
        kSpn: spn,
        kBbox: bbox,
        kResults: results,
        kSkip: skip,
        kLang: lang,
      };

  /// Преобразование модели в json
  Map<String, String> toJson() => <String, String>{
        kApiKey: apiKey,
        kFormat: kJson,
        kSco: kLongLat,
        kGeocode: geocode._toGeocode(),
        if (kind != null) kKind: kind._toKind(),
        if (rspn != null) kRspn: (rspn ? 1 : 0).toString(),
        if (ll != null) kLl: ll._toGeocode(),
        if (spn != null) kSpn: spn._toGeocode(),
        if (bbox != null) kBbox: bbox._toGeocode(),
        if (results != null) kResults: results.toString(),
        if (skip != null) kSkip: skip.toString(),
        if (lang != null) kLang: lang._toLang(),
      };
}
