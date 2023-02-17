part of 'request.dart';

/// {@template search_area}
/// Области поиска
/// {@endtemplate}
abstract class SearchArea with Comparer {
  /// {@macro search_area}
  SearchArea();
  // ignore: unused_element
  String _toGeocode();
}

/// {@template search_area_ll}
/// Долгота и широта центра области поиска.
///
/// Примечание: Протяженность области поиска задается параметром spn [SearchAreaSPN].
/// {@endtemplate}
class SearchAreaLL extends SearchArea {
  /// {@macro search_area_ll}
  SearchAreaLL({
    required this.latitude,
    required this.longitude,
  });

  /// Широта
  final double latitude;

  /// Долгота
  final double longitude;

  @override
  String _toGeocode() {
    return '$longitude,$latitude';
  }

  @override
  List<Object> get comparedObjects => <Object>[latitude, longitude];
}

/// {@template search_area_spn}
/// Протяженность области поиска.
///
/// Примечание: Если параметр kind имеет значение district, параметр spn не учитывается.
/// {@endtemplate}
class SearchAreaSPN extends SearchArea {
  /// {@macro search_area_spn}
  SearchAreaSPN({
    required this.differenceLatitude,
    required this.differenceLongitude,
  });

  /// Разницу между максимальной и минимальной широтой области;
  final double differenceLatitude;

  /// Разницу между максимальной и минимальной долготой области;
  final double differenceLongitude;

  @override
  String _toGeocode() {
    return '$differenceLongitude,$differenceLatitude';
  }

  @override
  List<Object> get comparedObjects =>
      <Object>[differenceLatitude, differenceLongitude];
}

/// {@template search_area_bbox}
///
/// Альтернативный способ задания области поиска.
/// Границы задаются в виде географических координат (в последовательности «долгота, широта»)
/// левого нижнего и правого верхнего углов области.
///
/// Примечание: При одновременном использовании параметров bbox и ll+spn,
/// параметр bbox будет более приоритетным.
/// {@endtemplate}
class SearchAreaBBOX extends SearchArea {
  /// {@macro search_area_bbox}
  SearchAreaBBOX({
    required this.latitudeLeft,
    required this.latitudeRight,
    required this.longitudeLeft,
    required this.longitudeRight,
  });

  /// Широта (левого нижнего)
  final double latitudeLeft;

  /// Широта (правого верхнего)
  final double latitudeRight;

  /// Долгота (левого нижнего)
  final double longitudeLeft;

  /// Долгота (правого верхнего)
  final double longitudeRight;

  @override
  String _toGeocode() {
    return '$latitudeLeft,$longitudeLeft-$latitudeRight,$longitudeRight';
  }

  @override
  List<Object> get comparedObjects =>
      <Object>[latitudeLeft, latitudeRight, longitudeLeft, longitudeRight];
}
