// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoObjectCollection _$GeoObjectCollectionFromJson(Map<String, dynamic> json) {
  return GeoObjectCollection(
    metaDataProperty: json['metaDataProperty'] == null
        ? null
        : GeoObjectCollectionMetaDataProperty.fromJson(
            json['metaDataProperty'] as Map<String, dynamic>),
    featureMember: (json['featureMember'] as List)
        ?.map((e) => e == null
            ? null
            : FeatureMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FeatureMember _$FeatureMemberFromJson(Map<String, dynamic> json) {
  return FeatureMember(
    geoObject: json['GeoObject'] == null
        ? null
        : GeoObject.fromJson(json['GeoObject'] as Map<String, dynamic>),
  );
}

GeoObject _$GeoObjectFromJson(Map<String, dynamic> json) {
  return GeoObject(
    metaDataProperty: json['metaDataProperty'] == null
        ? null
        : GeoObjectMetaDataProperty.fromJson(
            json['metaDataProperty'] as Map<String, dynamic>),
    name: json['name'] as String,
    description: json['description'] as String,
    boundedBy: json['boundedBy'] == null
        ? null
        : BoundedBy.fromJson(json['boundedBy'] as Map<String, dynamic>),
    point: json['Point'] == null
        ? null
        : Point.fromJson(json['Point'] as Map<String, dynamic>),
  );
}

GeoObjectMetaDataProperty _$GeoObjectMetaDataPropertyFromJson(
    Map<String, dynamic> json) {
  return GeoObjectMetaDataProperty(
    geocoderMetaData: json['GeocoderMetaData'] == null
        ? null
        : GeocoderMetaData.fromJson(
            json['GeocoderMetaData'] as Map<String, dynamic>),
  );
}

GeocoderMetaData _$GeocoderMetaDataFromJson(Map<String, dynamic> json) {
  return GeocoderMetaData(
    precision: json['precision'] as String,
    text: json['text'] as String,
    kind: _$enumDecodeNullable(_$KindResponseEnumMap, json['kind'],
        unknownValue: KindResponse.unknown),
    address: json['Address'] == null
        ? null
        : Address.fromJson(json['Address'] as Map<String, dynamic>),
    addressDetails: json['AddressDetails'] == null
        ? null
        : AddressDetails.fromJson(
            json['AddressDetails'] as Map<String, dynamic>),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$KindResponseEnumMap = {
  KindResponse.house: 'house',
  KindResponse.street: 'street',
  KindResponse.metro: 'metro',
  KindResponse.district: 'district',
  KindResponse.locality: 'locality',
  KindResponse.country: 'country',
  KindResponse.province: 'province',
  KindResponse.area: 'area',
  KindResponse.hydro: 'hydro',
  KindResponse.unknown: 'unknown',
};

GeoObjectCollectionMetaDataProperty
    _$GeoObjectCollectionMetaDataPropertyFromJson(Map<String, dynamic> json) {
  return GeoObjectCollectionMetaDataProperty(
    geocoderResponseMetaData: json['GeocoderResponseMetaData'] == null
        ? null
        : GeocoderResponseMetaData.fromJson(
            json['GeocoderResponseMetaData'] as Map<String, dynamic>),
  );
}

GeocoderResponseMetaData _$GeocoderResponseMetaDataFromJson(
    Map<String, dynamic> json) {
  return GeocoderResponseMetaData(
    point: json['Point'] == null
        ? null
        : Point.fromJson(json['Point'] as Map<String, dynamic>),
    boundedBy: json['boundedBy'] == null
        ? null
        : BoundedBy.fromJson(json['boundedBy'] as Map<String, dynamic>),
    request: json['request'] as String,
    results: json['results'] as String,
    found: json['found'] as String,
  );
}
