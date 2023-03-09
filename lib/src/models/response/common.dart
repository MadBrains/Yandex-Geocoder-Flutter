import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_geocoder/src/models/models.dart';

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
    this.pos,
  });

  /// Преобразование json в модель
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  /// Широта
  double get latitude => pos?.isNotEmpty == true
      ? double.tryParse((pos ?? '').split(' ').last) ?? 0
      : 0.0;

  /// Долгота
  double get longitude => pos?.isNotEmpty == true
      ? double.tryParse((pos ?? '').split(' ').first) ?? 0
      : 0.0;

  /// Собрать в Record-объект
  PointRecord? get record => (latitude, longitude);

  /// Координаты точки
  @JsonKey(name: kPos)
  final String? pos;


  @override
  List<Object?> get comparedObjects => <Object?>[pos];
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
