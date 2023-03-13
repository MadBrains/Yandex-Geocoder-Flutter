part of 'request.dart';

/// {@template geocode_request}
/// Модель запроса на геокодирования
/// {@endtemplate}
abstract base class GeocodeRequest with Comparer {
  /// {@template geocode_request}
  const GeocodeRequest({
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

  String get _toGeocode;

  /// Ключ, полученный в Кабинете разработчика
  final String? apiKey;

  /// {@macro kind_request}
  final KindRequest? kind;

  /// Флаг, задающий ограничение поиска указанной областью.
  /// Область задается параметрами [ll] и [spn] либо [bbox].
  ///
  /// Возможные значения:
  /// - [false] — не ограничивать поиск,
  /// - [true] — ограничивать поиск.
  final bool? rspn;

  /// {@macro search_area_ll}
  final SearchAreaLL? ll;

  /// {@macro search_area_spn}
  final SearchAreaSPN? spn;

  /// {@macro search_area_bbox}
  final SearchAreaBBOX? bbox;

  /// Максимальное количество возвращаемых объектов.
  ///
  /// Если указан параметр [skip] то значение нужно задать явно.
  ///
  /// Максимальное допустимое значение: 100.
  final int? results;

  /// Количество пропускаемых объектов в ответе, начиная с первого.
  ///
  /// Если указано, нужно также задать значение [results].
  /// Значение [skip] должно нацело делиться на значение [results].
  final int? skip;

  /// {@macro lang}
  final Lang? lang;

  /// Добавления ключа апи
  /// Возвращает копию объекта с новым ключом
  GeocodeRequest withKey(String apiKey);

  /// Преобразование модели в json
  Map<String, String> toJson() =>
      <String, String>{
        if (apiKey != null) kApiKey: apiKey!,
        kFormat: kJson,
        kSco: kLongLat,
        kGeocode: _toGeocode,
        if (kind != null) kKind: kind!._toKind(),
        if (rspn != null) kRspn: (rspn! ? 1 : 0).toString(),
        if (ll != null) kLl: ll!._toGeocode(),
        if (spn != null) kSpn: spn!._toGeocode(),
        if (bbox != null) kBbox: bbox!._toGeocode(),
        if (results != null) kResults: results!.toString(),
        if (skip != null) kSkip: skip!.toString(),
        if (lang != null) kLang: lang!._toLang(),
      };

  @override
  List<Object?> get comparedObjects =>
      <Object?>[
        apiKey,
        kind,
        rspn,
        ll,
        spn,
        bbox,
        results,
        skip,
        lang,
      ];
}

/// {@template direct_geocode_request}
/// Запрос для геокодирования через адрес искомого объекта.
/// Этот процесс называется прямым геокодированием.
/// {@endtemplate}
class DirectGeocodeRequest extends GeocodeRequest {
  /// {@macro direct_geocode_request}
  factory DirectGeocodeRequest({
    required String addressGeocode,
    KindRequest? kind,
    bool? rspn,
    SearchAreaLL? ll,
    SearchAreaSPN? spn,
    SearchAreaBBOX? bbox,
    int? results,
    int? skip,
    Lang? lang,
  }) =>
      DirectGeocodeRequest._(
        addressGeocode: addressGeocode,
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
  /// {@macro direct_geocode_request}
  factory DirectGeocodeRequest.withKey({
    required String apiKey,
    required String addressGeocode,
    KindRequest? kind,
    bool? rspn,
    SearchAreaLL? ll,
    SearchAreaSPN? spn,
    SearchAreaBBOX? bbox,
    int? results,
    int? skip,
    Lang? lang,
  }) =>
      DirectGeocodeRequest._(
        apiKey: apiKey,
        addressGeocode: addressGeocode,
        kind: kind,
        rspn: rspn,
        ll: ll,
        spn: spn,
        bbox: bbox,
        results: results,
        skip: skip,
        lang: lang,
      );

  const DirectGeocodeRequest._({
    required this.addressGeocode,
    String? apiKey,
    KindRequest? kind,
    bool? rspn,
    SearchAreaLL? ll,
    SearchAreaSPN? spn,
    SearchAreaBBOX? bbox,
    int? results,
    int? skip,
    Lang? lang,
  }) : super(
    apiKey: apiKey,
    kind: kind,
    rspn: rspn,
    ll: ll,
    spn: spn,
    bbox: bbox,
    results: results,
    skip: skip,
    lang: lang,
  );

  /// Адрес искомого объекта.
  /// Используется для прямого геокодирования.
  final String addressGeocode;

  @override
  String get _toGeocode => addressGeocode;

  @override
  DirectGeocodeRequest withKey(String apiKey) =>
      DirectGeocodeRequest._(
        apiKey: apiKey,
        addressGeocode: addressGeocode,
        kind: kind,
        rspn: rspn,
        ll: ll,
        spn: spn,
        bbox: bbox,
        results: results,
        skip: skip,
        lang: lang,
      );
}


/// {@template direct_geocode_request}
/// Запрос для геокодирования через координаты искомого объекта.
/// Этот процесс называется обратным геокодированием.
/// {@endtemplate}
class ReverseGeocodeRequest extends GeocodeRequest {
  /// {@macro direct_geocode_request}
  factory ReverseGeocodeRequest({
    required PointRecord pointGeocode,
    KindRequest? kind,
    bool? rspn,
    SearchAreaLL? ll,
    SearchAreaSPN? spn,
    SearchAreaBBOX? bbox,
    int? results,
    int? skip,
    Lang? lang,
  }) =>
      ReverseGeocodeRequest._(
        pointGeocode: pointGeocode,
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
  /// {@macro direct_geocode_request}
  factory ReverseGeocodeRequest.withKey({
    required String apiKey,
    required PointRecord pointGeocode,
    KindRequest? kind,
    bool? rspn,
    SearchAreaLL? ll,
    SearchAreaSPN? spn,
    SearchAreaBBOX? bbox,
    int? results,
    int? skip,
    Lang? lang,
  }) =>
      ReverseGeocodeRequest._(
        apiKey: apiKey,
        pointGeocode: pointGeocode,
        kind: kind,
        rspn: rspn,
        ll: ll,
        spn: spn,
        bbox: bbox,
        results: results,
        skip: skip,
        lang: lang,
      );

  const ReverseGeocodeRequest._({
    required this.pointGeocode,
    String? apiKey,
    KindRequest? kind,
    bool? rspn,
    SearchAreaLL? ll,
    SearchAreaSPN? spn,
    SearchAreaBBOX? bbox,
    int? results,
    int? skip,
    Lang? lang,
  }) : super(
    apiKey: apiKey,
    kind: kind,
    rspn: rspn,
    ll: ll,
    spn: spn,
    bbox: bbox,
    results: results,
    skip: skip,
    lang: lang,
  );

  /// Адрес искомого объекта.
  /// Используется для прямого геокодирования.
  final PointRecord pointGeocode;

  @override
  String get _toGeocode => const PointConverter().toJson(pointGeocode);

  @override
  ReverseGeocodeRequest withKey(String apiKey) =>
      ReverseGeocodeRequest._(
        apiKey: apiKey,
        pointGeocode: pointGeocode,
        kind: kind,
        rspn: rspn,
        ll: ll,
        spn: spn,
        bbox: bbox,
        results: results,
        skip: skip,
        lang: lang,
      );
}
