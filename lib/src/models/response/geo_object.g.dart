// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoObjectCollection _$GeoObjectCollectionFromJson(Map<String, dynamic> json) =>
    GeoObjectCollection(
      metaDataProperty: json['metaDataProperty'] == null
          ? null
          : GeoObjectCollectionMetaDataProperty.fromJson(
              json['metaDataProperty'] as Map<String, dynamic>),
      featureMember: (json['featureMember'] as List<dynamic>?)
          ?.map((e) => FeatureMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

FeatureMember _$FeatureMemberFromJson(Map<String, dynamic> json) =>
    FeatureMember(
      geoObject: json['GeoObject'] == null
          ? null
          : GeoObject.fromJson(json['GeoObject'] as Map<String, dynamic>),
    );

GeoObject _$GeoObjectFromJson(Map<String, dynamic> json) => GeoObject(
      metaDataProperty: json['metaDataProperty'] == null
          ? null
          : GeoObjectMetaDataProperty.fromJson(
              json['metaDataProperty'] as Map<String, dynamic>),
      name: json['name'] as String?,
      description: json['description'] as String?,
      boundedBy: json['boundedBy'] == null
          ? null
          : BoundedBy.fromJson(json['boundedBy'] as Map<String, dynamic>),
      point: json['Point'] == null
          ? null
          : Point.fromJson(json['Point'] as Map<String, dynamic>),
    );

GeoObjectMetaDataProperty _$GeoObjectMetaDataPropertyFromJson(
        Map<String, dynamic> json) =>
    GeoObjectMetaDataProperty(
      geocoderMetaData: json['GeocoderMetaData'] == null
          ? null
          : GeocoderMetaData.fromJson(
              json['GeocoderMetaData'] as Map<String, dynamic>),
    );

GeocoderMetaData _$GeocoderMetaDataFromJson(Map<String, dynamic> json) =>
    GeocoderMetaData(
      precision: json['precision'] as String?,
      text: json['text'] as String?,
      kind: $enumDecodeNullable(_$KindResponseEnumMap, json['kind'],
          unknownValue: KindResponse.unknown),
      address: json['Address'] == null
          ? null
          : Address.fromJson(json['Address'] as Map<String, dynamic>),
      addressDetails: json['AddressDetails'] == null
          ? null
          : AddressDetails.fromJson(
              json['AddressDetails'] as Map<String, dynamic>),
    );

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
    _$GeoObjectCollectionMetaDataPropertyFromJson(Map<String, dynamic> json) =>
        GeoObjectCollectionMetaDataProperty(
          geocoderResponseMetaData: json['GeocoderResponseMetaData'] == null
              ? null
              : GeocoderResponseMetaData.fromJson(
                  json['GeocoderResponseMetaData'] as Map<String, dynamic>),
        );

GeocoderResponseMetaData _$GeocoderResponseMetaDataFromJson(
        Map<String, dynamic> json) =>
    GeocoderResponseMetaData(
      point: json['Point'] == null
          ? null
          : Point.fromJson(json['Point'] as Map<String, dynamic>),
      boundedBy: json['boundedBy'] == null
          ? null
          : BoundedBy.fromJson(json['boundedBy'] as Map<String, dynamic>),
      request: json['request'] as String?,
      results: json['results'] as String?,
      found: json['found'] as String?,
    );
