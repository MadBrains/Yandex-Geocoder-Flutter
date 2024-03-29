import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';

part 'geo_object.g.dart';

/// {@template geo_object_collection}
/// Коллекция геообъектов
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class GeoObjectCollection with Comparer {
  /// {@macro geo_object_collection}
  const GeoObjectCollection({
    this.metaDataProperty,
    this.featureMember,
  });

  /// Преобразование json в модель
  factory GeoObjectCollection.fromJson(Map<String, dynamic> json) =>
      _$GeoObjectCollectionFromJson(json);

  /// Cвойство метаданных
  @JsonKey(name: kMetaDataProperty)
  final GeoObjectCollectionMetaDataProperty? metaDataProperty;

  /// Особенность геообъектов
  @JsonKey(name: kFeatureMember)
  final List<FeatureMember>? featureMember;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[metaDataProperty, featureMember];
}

/// {@template feature_member}
/// Особенность геообъектов
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class FeatureMember with Comparer {
  /// {@macro feature_member}
  const FeatureMember({
    this.geoObject,
  });

  /// Преобразование json в модель
  factory FeatureMember.fromJson(Map<String, dynamic> json) =>
      _$FeatureMemberFromJson(json);

  /// {@macro geo_object}
  @JsonKey(name: kGeoObject)
  final GeoObject? geoObject;

  @override
  List<Object?> get comparedObjects => <Object?>[geoObject];
}

/// {@template geo_object}
/// Геообъект
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class GeoObject with Comparer {
  /// {@macro geo_object}
  const GeoObject({
    this.metaDataProperty,
    this.name,
    this.description,
    this.boundedBy,
    this.point,
  });

  /// Преобразование json в модель
  factory GeoObject.fromJson(Map<String, dynamic> json) =>
      _$GeoObjectFromJson(json);

  /// Cвойство метаданных
  @JsonKey(name: kMetaDataProperty)
  final GeoObjectMetaDataProperty? metaDataProperty;

  /// Имя геообъекта
  @JsonKey(name: kName)
  final String? name;

  /// Описание геообъекта
  @JsonKey(name: kDescription)
  final String? description;

  /// Ограниченность по геообъекту
  @JsonKey(name: kBoundedBy)
  final BoundedBy? boundedBy;

  /// Координаты геообъекта
  @JsonKey(name: kPoint)
  final Point? point;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[metaDataProperty, name, description, boundedBy, point];
}

/// {@template meta_data_property}
/// Cвойство метаданных
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class GeoObjectMetaDataProperty with Comparer {
  /// {@macro meta_data_property}
  const GeoObjectMetaDataProperty({
    this.geocoderMetaData,
  });

  /// Преобразование json в модель
  factory GeoObjectMetaDataProperty.fromJson(Map<String, dynamic> json) =>
      _$GeoObjectMetaDataPropertyFromJson(json);

  /// {@macro meta_data_property}
  @JsonKey(name: kGeocoderMetaData)
  final GeocoderMetaData? geocoderMetaData;

  @override
  List<Object?> get comparedObjects => <Object?>[geocoderMetaData];
}

/// {@macro meta_data_property}
@JsonSerializable(createToJson: false)
class GeocoderMetaData with Comparer {
  /// {@macro meta_data_property}
  const GeocoderMetaData({
    this.precision,
    this.text,
    this.kind,
    this.address,
    this.addressDetails,
  });

  /// Преобразование json в модель
  factory GeocoderMetaData.fromJson(Map<String, dynamic> json) =>
      _$GeocoderMetaDataFromJson(json);

  /// Точность
  @JsonKey(name: kPrecision)
  final String? precision;

  /// Текст
  @JsonKey(name: kText)
  final String? text;

  /// {@macro kind_response}
  @JsonKey(name: kKind, unknownEnumValue: KindResponse.unknown)
  final KindResponse? kind;

  /// {@macro address}
  @JsonKey(name: kAddress)
  final Address? address;

  /// {@macro address_details}
  @JsonKey(name: kAddressDetails)
  final AddressDetails? addressDetails;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[precision, text, kind, address, addressDetails];
}

/// {@template geocoder_response_meta_data}
/// Свойство метаданных "Коллекция геообъектов"
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class GeoObjectCollectionMetaDataProperty with Comparer {
  /// {@macro geocoder_response_meta_data}
  const GeoObjectCollectionMetaDataProperty({
    this.geocoderResponseMetaData,
  });

  /// Преобразование json в модель
  factory GeoObjectCollectionMetaDataProperty.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GeoObjectCollectionMetaDataPropertyFromJson(json);

  /// {@macro geocoder_response_meta_data}
  @JsonKey(name: kGeocoderResponseMetaData)
  final GeocoderResponseMetaData? geocoderResponseMetaData;

  @override
  List<Object?> get comparedObjects => <Object?>[geocoderResponseMetaData];
}

/// {@macro geocoder_response_meta_data}
@JsonSerializable(createToJson: false)
class GeocoderResponseMetaData with Comparer {
  /// {@macro geocoder_response_meta_data}
  const GeocoderResponseMetaData({
    this.point,
    this.boundedBy,
    this.request,
    this.results,
    this.found,
  });

  /// Преобразование json в модель
  factory GeocoderResponseMetaData.fromJson(Map<String, dynamic> json) =>
      _$GeocoderResponseMetaDataFromJson(json);

  /// Коодрдинаты
  @JsonKey(name: kPoint)
  final Point? point;

  /// Область поиска
  @JsonKey(name: kBoundedBy)
  final BoundedBy? boundedBy;

  /// Запрос
  @JsonKey(name: kRequest)
  final String? request;

  /// Результаты
  @JsonKey(name: kResults)
  final String? results;

  /// Кол-во найденых
  @JsonKey(name: kFound)
  final String? found;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[point, boundedBy, request, results, found];
}
