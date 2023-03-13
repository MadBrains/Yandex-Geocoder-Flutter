import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_geocoder/src/models/models.dart';

/// {@template point_converter}
/// Конвертер для преобразования json-строки в объект PointRecord.
/// Используется при парсинге ответа GeocodeResponse в DTO.
/// {@endtemplate}
class PointConverter implements JsonConverter<PointRecord?, String?> {
  /// {@macro point_converter}
  const PointConverter();

  @override
  PointRecord? fromJson(String? json) {
    if (json == null) return null;

    final List<double?> splitPos = json.split(' ').map((String e) => double.tryParse(e)).toList();

    final double? lat = splitPos.first;
    final double? lon = splitPos.last;

    if (lat == null || lon == null) return null;

    return (lat, lon);
  }

  @override
  String toJson(PointRecord? object) {
    if (object == null) return '';

    return '${object.$1},${object.$2}';
  }
}
