import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_geocoder/src/models/models.dart';
import 'package:yandex_geocoder/src/models/point_converter.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';

part 'common.g.dart';

/// {@template point}
/// Точка
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Point with Comparer {
  /// {@macro point}
  const Point({
    this.point,
  });

  /// Преобразование json в модель
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  /// Широта
  double? get latitude => point?.lat;

  /// Долгота
  double? get longitude => point?.lon;

  /// Координаты точки
  @JsonKey(name: kPos)
  @PointConverter()
  final PointRecord? point;

  @override
  List<Object?> get comparedObjects => <Object?>[point];
}

/// {@template bounded_by}
/// Ограниченность по
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class BoundedBy with Comparer {
  /// {@macro bounded_by}
  const BoundedBy({
    this.envelope,
  });

  /// Преобразование json в модель
  factory BoundedBy.fromJson(Map<String, dynamic> json) =>
      _$BoundedByFromJson(json);

  /// {@macro envelope}
  @JsonKey(name: kEnvelope)
  final Envelope? envelope;

  @override
  List<Object?> get comparedObjects => <Object?>[envelope];
}

/// {@template envelope}
/// Области ограниченности
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Envelope with Comparer {
  /// {@macro envelope}
  const Envelope({
    this.lowerCorner,
    this.upperCorner,
  });

  /// Преобразование json в модель
  factory Envelope.fromJson(Map<String, dynamic> json) =>
      _$EnvelopeFromJson(json);

  /// Нижний угол
  @JsonKey(name: kLowerCorner)
  final String? lowerCorner;

  /// Верхний угол
  @JsonKey(name: kUpperCorner)
  final String? upperCorner;

  @override
  List<Object?> get comparedObjects => <Object?>[lowerCorner, upperCorner];
}
