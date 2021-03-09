part of 'request.dart';

/// {@template geocode}
/// Адрес либо географические координаты искомого объекта.
/// {@endtemplate}
///
/// [PointGeocode]
/// {@macro point_geocode}
///
/// [AddressGeocode]
/// {@macro address_geocode}
abstract class Geocode with Comparer {
  /// {@macro geocode}
  Geocode();

  String _toGeocode();
}

/// {@template point_geocode}
/// Географические координаты искомого объекта.
/// Этот процесс называется обратным геокодированием.
/// {@endtemplate}
class PointGeocode extends Geocode {
  /// {@macro point_geocode}
  PointGeocode({
    required this.latitude,
    required this.longitude,
  });

  /// Широта
  final double latitude;

  /// Долгота
  final double longitude;

  @override
  String _toGeocode() {
    return '$latitude,$longitude';
  }

  @override
  Map<String, Object> get equals => <String, Object>{
        'Latitude': latitude,
        'Longitude': longitude,
      };
}

/// {@template address_geocode}
/// Адрес искомого объекта.
/// Этот процесс называется прямым геокодированием.
/// {@endtemplate}
class AddressGeocode extends Geocode {
  /// {@macro address_geocode}
  AddressGeocode({required this.address});

  /// Адрес
  final String address;

  @override
  String _toGeocode() {
    return address;
  }

  @override
  Map<String, Object> get equals => <String, Object>{
        'Address': address,
      };
}
