// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      countryCode: json['country_code'] as String?,
      formatted: json['formatted'] as String?,
      postalCode: json['postal_code'] as String?,
      components: (json['Components'] as List<dynamic>?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      kind: $enumDecodeNullable(_$KindResponseEnumMap, json['kind'],
          unknownValue: KindResponse.unknown),
      name: json['name'] as String?,
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

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) =>
    AddressDetails(
      country: json['Country'] == null
          ? null
          : Country.fromJson(json['Country'] as Map<String, dynamic>),
    );

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      addressLine: json['AddressLine'] as String?,
      countryNameCode: json['CountryNameCode'] as String?,
      countryName: json['CountryName'] as String?,
      administrativeArea: json['AdministrativeArea'] == null
          ? null
          : AdministrativeArea.fromJson(
              json['AdministrativeArea'] as Map<String, dynamic>),
    );

AdministrativeArea _$AdministrativeAreaFromJson(Map<String, dynamic> json) =>
    AdministrativeArea(
      administrativeAreaName: json['AdministrativeAreaName'] as String?,
      subAdministrativeArea: json['SubAdministrativeArea'] == null
          ? null
          : SubAdministrativeArea.fromJson(
              json['SubAdministrativeArea'] as Map<String, dynamic>),
      locality: json['Locality'] == null
          ? null
          : Locality.fromJson(json['Locality'] as Map<String, dynamic>),
    );

SubAdministrativeArea _$SubAdministrativeAreaFromJson(
        Map<String, dynamic> json) =>
    SubAdministrativeArea(
      subAdministrativeAreaName: json['SubAdministrativeAreaName'] as String?,
      locality: json['Locality'] == null
          ? null
          : Locality.fromJson(json['Locality'] as Map<String, dynamic>),
    );

Locality _$LocalityFromJson(Map<String, dynamic> json) => Locality(
      localityName: json['LocalityName'] as String?,
      premise: json['Premise'] == null
          ? null
          : Premise.fromJson(json['Premise'] as Map<String, dynamic>),
      thoroughfare: json['Thoroughfare'] == null
          ? null
          : Thoroughfare.fromJson(json['Thoroughfare'] as Map<String, dynamic>),
      dependentLocality: json['DependentLocality'] == null
          ? null
          : LocalityDependentLocality.fromJson(
              json['DependentLocality'] as Map<String, dynamic>),
    );

LocalityDependentLocality _$LocalityDependentLocalityFromJson(
        Map<String, dynamic> json) =>
    LocalityDependentLocality(
      dependentLocalityName: json['DependentLocalityName'] as String?,
      dependentLocality: json['DependentLocality'] == null
          ? null
          : LocalityDependentLocality.fromJson(
              json['DependentLocality'] as Map<String, dynamic>),
    );

Thoroughfare _$ThoroughfareFromJson(Map<String, dynamic> json) => Thoroughfare(
      thoroughfareName: json['ThoroughfareName'] as String?,
      premise: json['Premise'] == null
          ? null
          : Premise.fromJson(json['Premise'] as Map<String, dynamic>),
    );

Premise _$PremiseFromJson(Map<String, dynamic> json) => Premise(
      premiseNumber: json['PremiseNumber'] as String?,
      postalCode: json['PostalCode'] == null
          ? null
          : PostalCode.fromJson(json['PostalCode'] as Map<String, dynamic>),
      premiseName: json['PremiseName'] as String?,
    );

PostalCode _$PostalCodeFromJson(Map<String, dynamic> json) => PostalCode(
      postalCodeNumber: json['PostalCodeNumber'] as String?,
    );
