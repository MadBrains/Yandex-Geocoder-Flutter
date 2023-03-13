import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_geocoder/src/models/models.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';

part 'geocode_response.g.dart';

/// {@template geocode_response}
/// Модель ответа геокодирования
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class GeocodeResponse with Comparer {
  /// {@macro geocode_response}
  const GeocodeResponse({
    this.response,
  });

  /// Преобразование json в модель
  factory GeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodeResponseFromJson(json);

  GeoObject? get _firstGeoObject =>
      response?.geoObjectCollection?.featureMember?.first.geoObject;

  /// Первый адрес
  Address? get firstAddress =>
      _firstGeoObject?.metaDataProperty?.geocoderMetaData?.address;

  /// Первая страна
  Country? get firstCountry => _firstGeoObject
      ?.metaDataProperty?.geocoderMetaData?.addressDetails?.country;

  /// Первая координата
  PointRecord? get firstPoint => _firstGeoObject?.point?.point;

  /// Первый полный адрес с координатой
  FullAddress get firstFullAddress => FullAddress(
        countryCode: firstAddress?.countryCode,
        formattedAddress: firstAddress?.formatted,
        postalCode: firstAddress?.postalCode,
        point: firstPoint,
      );

  GeoObject? _geoObject(int id) =>
      response?.geoObjectCollection?.featureMember?[id].geoObject;

  /// Адрес по id
  Address? address(int id) =>
      _geoObject(id)?.metaDataProperty?.geocoderMetaData?.address;

  /// Страна по id
  Country? country(int id) => _geoObject(id)
      ?.metaDataProperty
      ?.geocoderMetaData
      ?.addressDetails
      ?.country;

  /// Координата по id
  PointRecord? point(int id) => _geoObject(id)?.point?.point;

  /// Полный адрес с координатой по id
  FullAddress fullAddress(int id) => FullAddress(
        countryCode: address(id)?.countryCode,
        formattedAddress: address(id)?.formatted,
        postalCode: address(id)?.postalCode,
        point: point(id),
      );

  /// {@macro response}
  @JsonKey(name: kResponse)
  final Response? response;

  @override
  List<Object?> get comparedObjects => <Object?>[response];
}

/// {@template response}
/// Модель ответа
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Response with Comparer {
  /// {@macro response}
  const Response({
    this.geoObjectCollection,
  });

  /// Преобразование json в модель
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// Коллекция геообъектов
  @JsonKey(name: kGeoObjectCollection)
  final GeoObjectCollection? geoObjectCollection;

  @override
  List<Object?> get comparedObjects => <Object?>[geoObjectCollection];
}
