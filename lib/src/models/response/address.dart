import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';
import 'response.dart';

part 'address.g.dart';

/// {@template full_address}
/// Модель полного адреса с координатой
/// {@endtemplate}
class FullAddress with Comparer {
  /// {@macro full_address}
  FullAddress({
    this.countryCode,
    this.formattedAddress,
    this.postalCode,
    this.point,
  });

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kCountryCode: countryCode,
        kFormatted: formattedAddress,
        kPostalCode: postalCode,
        kPoint: point,
      };

  /// Код страны
  final String? countryCode;

  /// Форматированный адрес
  final String? formattedAddress;

  /// Почтовый адрес
  final String? postalCode;

  /// Координаты адреса
  final Point? point;
}

/// {@template address}
/// Модель адреса
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Address with Comparer {
  /// {@macro address}
  Address({
    this.countryCode,
    this.formatted,
    this.postalCode,
    this.components,
  });

  /// Преобразование json в модель
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kCountryCode: countryCode,
        kFormatted: formatted,
        kPostalCode: postalCode,
        kComponents: components,
      };

  /// Код страны
  @JsonKey(name: kCountryCode)
  final String? countryCode;

  /// Форматированный адрес
  @JsonKey(name: kFormatted)
  final String? formatted;

  /// Почтовый адрес
  @JsonKey(name: kPostalCode)
  final String? postalCode;

  /// Компоненты адреса
  @JsonKey(name: kComponents)
  final List<Component>? components;
}

/// {@template component}
/// Модель компонента адреса
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Component with Comparer {
  /// {@macro address}
  Component({
    this.kind,
    this.name,
  });

  /// Преобразование json в модель
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kKind: kind,
        kName: name,
      };

  /// Тип адреса
  @JsonKey(name: kKind, unknownEnumValue: KindResponse.unknown)
  final KindResponse? kind;

  /// Имя компонента
  @JsonKey(name: kName)
  final String? name;
}

/// {@template address_details}
/// Подробности адреса
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class AddressDetails with Comparer {
  /// {@macro address_details}
  AddressDetails({
    this.country,
  });

  /// Преобразование json в модель
  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kCountry: country,
      };

  /// {@macro country}
  @JsonKey(name: kCountry)
  final Country? country;
}

/// {@template country}
/// Страна
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Country with Comparer {
  /// {@macro country}
  Country({
    this.addressLine,
    this.countryNameCode,
    this.countryName,
    this.administrativeArea,
  });

  /// Преобразование json в модель
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kAddressLine: addressLine,
        kCountryNameCode: countryNameCode,
        kCountryName: countryName,
        kAdministrativeArea: administrativeArea,
      };

  /// Полный адрес
  @JsonKey(name: kAddressLine)
  final String? addressLine;

  /// Код страны
  @JsonKey(name: kCountryNameCode)
  final String? countryNameCode;

  /// Имя страны
  @JsonKey(name: kCountryName)
  final String? countryName;

  /// Административный район
  @JsonKey(name: kAdministrativeArea)
  final AdministrativeArea? administrativeArea;
}

/// {@template administrative_area}
/// Административный район
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class AdministrativeArea with Comparer {
  /// {@macro administrative_area}
  AdministrativeArea({
    this.administrativeAreaName,
    this.subAdministrativeArea,
    this.locality,
  });

  /// Преобразование json в модель
  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      _$AdministrativeAreaFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kAdministrativeAreaName: administrativeAreaName,
        kSubAdministrativeArea: subAdministrativeArea,
        kLocality: locality,
      };

  /// Имя административного района
  @JsonKey(name: kAdministrativeAreaName)
  final String? administrativeAreaName;

  /// Субадминистративный район
  @JsonKey(name: kSubAdministrativeArea)
  final SubAdministrativeArea? subAdministrativeArea;

  /// Местонахождение
  @JsonKey(name: kLocality)
  final Locality? locality;
}

/// {@template sub_administrative_area}
/// Субадминистративный район
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class SubAdministrativeArea with Comparer {
  /// {@macro sub_administrative_area}
  SubAdministrativeArea({
    this.subAdministrativeAreaName,
    this.locality,
  });

  /// Преобразование json в модель
  factory SubAdministrativeArea.fromJson(Map<String, dynamic> json) =>
      _$SubAdministrativeAreaFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kSubAdministrativeAreaName: subAdministrativeAreaName,
        kLocality: locality,
      };

  /// Имя субадминистративного района
  @JsonKey(name: kSubAdministrativeAreaName)
  final String? subAdministrativeAreaName;

  /// Местонахождение
  @JsonKey(name: kLocality)
  final Locality? locality;
}

/// {@template locality}
/// Местонахождение
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Locality with Comparer {
  /// {@macro locality}
  Locality({
    this.localityName,
    this.premise,
    this.thoroughfare,
    this.dependentLocality,
  });

  /// Преобразование json в модель
  factory Locality.fromJson(Map<String, dynamic> json) =>
      _$LocalityFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kLocalityName: localityName,
        kPremise: premise,
        kThoroughfare: thoroughfare,
        kDependentLocality: dependentLocality,
      };

  /// Название населенного пункта
  @JsonKey(name: kLocalityName)
  final String? localityName;

  /// Владение
  @JsonKey(name: kPremise)
  final Premise? premise;

  /// Улица
  @JsonKey(name: kThoroughfare)
  final Thoroughfare? thoroughfare;

  /// {@macro dependent_locality}
  @JsonKey(name: kDependentLocality)
  final LocalityDependentLocality? dependentLocality;
}

/// {@template dependent_locality}
/// Зависимые местонахождения
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class LocalityDependentLocality with Comparer {
  /// {@macro dependent_locality}
  LocalityDependentLocality({
    this.dependentLocalityName,
    this.dependentLocality,
  });

  /// Преобразование json в модель
  factory LocalityDependentLocality.fromJson(Map<String, dynamic> json) =>
      _$LocalityDependentLocalityFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kDependentLocalityName: dependentLocalityName,
        kDependentLocality: dependentLocality,
      };

  /// Имя зависимого местонахождения
  @JsonKey(name: kDependentLocalityName)
  final String? dependentLocalityName;

  /// {@macro dependent_locality}
  @JsonKey(name: kDependentLocality)
  final LocalityDependentLocality? dependentLocality;
}

/// {@template thoroughfare}
/// Улица
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Thoroughfare with Comparer {
  /// {@macro thoroughfare}
  Thoroughfare({
    this.thoroughfareName,
    this.premise,
  });

  /// Преобразование json в модель
  factory Thoroughfare.fromJson(Map<String, dynamic> json) =>
      _$ThoroughfareFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kThoroughfareName: thoroughfareName,
        kPremise: premise,
      };

  /// Имя улицы
  @JsonKey(name: kThoroughfareName)
  final String? thoroughfareName;

  /// Владение
  @JsonKey(name: kPremise)
  final Premise? premise;
}

/// {@template premise}
/// Владения
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Premise with Comparer {
  /// {@macro premise}
  Premise({
    this.premiseNumber,
    this.postalCode,
    this.premiseName,
  });

  /// Преобразование json в модель
  factory Premise.fromJson(Map<String, dynamic> json) =>
      _$PremiseFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kPremiseName: premiseName,
        kPremiseNumber: premiseNumber,
        kPostalCode2: postalCode,
      };

  /// Имя владения
  @JsonKey(name: kPremiseName)
  final String? premiseName;

  /// Номер владения
  @JsonKey(name: kPremiseNumber)
  final String? premiseNumber;

  /// Почтовый индекс
  @JsonKey(name: kPostalCode2)
  final PostalCode? postalCode;
}

/// {@template postal_code}
/// Почтовый индекс
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class PostalCode with Comparer {
  /// {@macro postal_code}
  PostalCode({
    this.postalCodeNumber,
  });

  /// Преобразование json в модель
  factory PostalCode.fromJson(Map<String, dynamic> json) =>
      _$PostalCodeFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kPostalCodeNumber: postalCodeNumber,
      };

  /// Почтовый индекс
  @JsonKey(name: kPostalCodeNumber)
  final String? postalCodeNumber;
}
