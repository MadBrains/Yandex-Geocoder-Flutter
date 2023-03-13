import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';

part 'address.g.dart';

/// {@template full_address}
/// Модель полного адреса с координатой
/// {@endtemplate}
class FullAddress with Comparer {
  /// {@macro full_address}
  const FullAddress({
    this.countryCode,
    this.formattedAddress,
    this.postalCode,
    this.point,
  });

  /// Код страны
  final String? countryCode;

  /// Форматированный адрес
  final String? formattedAddress;

  /// Почтовый адрес
  final String? postalCode;

  /// Координаты адреса
  final PointRecord? point;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[countryCode, formattedAddress, postalCode, point];
}

/// {@template address}
/// Модель адреса
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Address with Comparer {
  /// {@macro address}
  const Address({
    this.countryCode,
    this.formatted,
    this.postalCode,
    this.components,
  });

  /// Преобразование json в модель
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

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

  @override
  List<Object?> get comparedObjects =>
      <Object?>[countryCode, formatted, postalCode, components];
}

/// {@template component}
/// Модель компонента адреса
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Component with Comparer {
  /// {@macro address}
  const Component({
    this.kind,
    this.name,
  });

  /// Преобразование json в модель
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  /// Тип адреса
  @JsonKey(name: kKind, unknownEnumValue: KindResponse.unknown)
  final KindResponse? kind;

  /// Имя компонента
  @JsonKey(name: kName)
  final String? name;

  @override
  List<Object?> get comparedObjects => <Object?>[kind, name];
}

/// {@template address_details}
/// Подробности адреса
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class AddressDetails with Comparer {
  /// {@macro address_details}
  const AddressDetails({
    this.country,
  });

  /// Преобразование json в модель
  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);

  /// {@macro country}
  @JsonKey(name: kCountry)
  final Country? country;

  @override
  List<Object?> get comparedObjects => <Object?>[country];
}

/// {@template country}
/// Страна
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Country with Comparer {
  /// {@macro country}
  const Country({
    this.addressLine,
    this.countryNameCode,
    this.countryName,
    this.administrativeArea,
  });

  /// Преобразование json в модель
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

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

  @override
  List<Object?> get comparedObjects =>
      <Object?>[addressLine, countryNameCode, countryName, administrativeArea];
}

/// {@template administrative_area}
/// Административный район
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class AdministrativeArea with Comparer {
  /// {@macro administrative_area}
  const AdministrativeArea({
    this.administrativeAreaName,
    this.subAdministrativeArea,
    this.locality,
  });

  /// Преобразование json в модель
  factory AdministrativeArea.fromJson(Map<String, dynamic> json) =>
      _$AdministrativeAreaFromJson(json);

  /// Имя административного района
  @JsonKey(name: kAdministrativeAreaName)
  final String? administrativeAreaName;

  /// Субадминистративный район
  @JsonKey(name: kSubAdministrativeArea)
  final SubAdministrativeArea? subAdministrativeArea;

  /// Местонахождение
  @JsonKey(name: kLocality)
  final Locality? locality;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[administrativeAreaName, subAdministrativeArea, locality];
}

/// {@template sub_administrative_area}
/// Субадминистративный район
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class SubAdministrativeArea with Comparer {
  /// {@macro sub_administrative_area}
  const SubAdministrativeArea({
    this.subAdministrativeAreaName,
    this.locality,
  });

  /// Преобразование json в модель
  factory SubAdministrativeArea.fromJson(Map<String, dynamic> json) =>
      _$SubAdministrativeAreaFromJson(json);

  /// Имя субадминистративного района
  @JsonKey(name: kSubAdministrativeAreaName)
  final String? subAdministrativeAreaName;

  /// Местонахождение
  @JsonKey(name: kLocality)
  final Locality? locality;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[subAdministrativeAreaName, locality];
}

/// {@template locality}
/// Местонахождение
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Locality with Comparer {
  /// {@macro locality}
  const Locality({
    this.localityName,
    this.premise,
    this.thoroughfare,
    this.dependentLocality,
  });

  /// Преобразование json в модель
  factory Locality.fromJson(Map<String, dynamic> json) =>
      _$LocalityFromJson(json);

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

  @override
  List<Object?> get comparedObjects =>
      <Object?>[localityName, premise, thoroughfare, dependentLocality];
}

/// {@template dependent_locality}
/// Зависимые местонахождения
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class LocalityDependentLocality with Comparer {
  /// {@macro dependent_locality}
  const LocalityDependentLocality({
    this.dependentLocalityName,
    this.dependentLocality,
  });

  /// Преобразование json в модель
  factory LocalityDependentLocality.fromJson(Map<String, dynamic> json) =>
      _$LocalityDependentLocalityFromJson(json);

  /// Имя зависимого местонахождения
  @JsonKey(name: kDependentLocalityName)
  final String? dependentLocalityName;

  /// {@macro dependent_locality}
  @JsonKey(name: kDependentLocality)
  final LocalityDependentLocality? dependentLocality;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[dependentLocalityName, dependentLocality];
}

/// {@template thoroughfare}
/// Улица
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Thoroughfare with Comparer {
  /// {@macro thoroughfare}
  const Thoroughfare({
    this.thoroughfareName,
    this.premise,
  });

  /// Преобразование json в модель
  factory Thoroughfare.fromJson(Map<String, dynamic> json) =>
      _$ThoroughfareFromJson(json);

  /// Имя улицы
  @JsonKey(name: kThoroughfareName)
  final String? thoroughfareName;

  /// Владение
  @JsonKey(name: kPremise)
  final Premise? premise;

  @override
  List<Object?> get comparedObjects => <Object?>[thoroughfareName, premise];
}

/// {@template premise}
/// Владения
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Premise with Comparer {
  /// {@macro premise}
  const Premise({
    this.premiseNumber,
    this.postalCode,
    this.premiseName,
  });

  /// Преобразование json в модель
  factory Premise.fromJson(Map<String, dynamic> json) =>
      _$PremiseFromJson(json);

  /// Имя владения
  @JsonKey(name: kPremiseName)
  final String? premiseName;

  /// Номер владения
  @JsonKey(name: kPremiseNumber)
  final String? premiseNumber;

  /// Почтовый индекс
  @JsonKey(name: kPostalCode2)
  final PostalCode? postalCode;

  @override
  List<Object?> get comparedObjects =>
      <Object?>[premiseName, premiseNumber, postalCode];
}

/// {@template postal_code}
/// Почтовый индекс
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class PostalCode with Comparer {
  /// {@macro postal_code}
  const PostalCode({
    this.postalCodeNumber,
  });

  /// Преобразование json в модель
  factory PostalCode.fromJson(Map<String, dynamic> json) =>
      _$PostalCodeFromJson(json);

  /// Почтовый индекс
  @JsonKey(name: kPostalCodeNumber)
  final String? postalCodeNumber;

  @override
  List<Object?> get comparedObjects => <Object?>[postalCodeNumber];
}
