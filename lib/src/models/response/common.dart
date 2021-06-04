import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';

part 'common.g.dart';

/// {@template point}
/// Точка
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Point with Comparer {
  /// {@macro point}
  Point({
    this.pos,
  });

  /// Преобразование json в модель
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kPos: pos,
      };

  /// Широта
  double get latitude => pos?.isNotEmpty == true
      ? double.tryParse((pos ?? '').split(' ').last) ?? 0
      : 0.0;

  /// Долгота
  double get longitude => pos?.isNotEmpty == true
      ? double.tryParse((pos ?? '').split(' ').first) ?? 0
      : 0.0;

  /// Координаты точки
  @JsonKey(name: kPos)
  final String? pos;
}

/// {@template bounded_by}
/// Ограниченность по
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class BoundedBy with Comparer {
  /// {@macro bounded_by}
  BoundedBy({
    this.envelope,
  });

  /// Преобразование json в модель
  factory BoundedBy.fromJson(Map<String, dynamic> json) =>
      _$BoundedByFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kEnvelope: envelope,
      };

  /// {@macro envelope}
  @JsonKey(name: kEnvelope)
  final Envelope? envelope;
}

/// {@template envelope}
/// Области ограниченности
/// {@endtemplate}
@JsonSerializable(createToJson: false)
class Envelope with Comparer {
  /// {@macro envelope}
  Envelope({
    this.lowerCorner,
    this.upperCorner,
  });

  /// Преобразование json в модель
  factory Envelope.fromJson(Map<String, dynamic> json) =>
      _$EnvelopeFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kLowerCorner: lowerCorner,
        kUpperCorner: upperCorner,
      };

  /// Нижний угол
  @JsonKey(name: kLowerCorner)
  final String? lowerCorner;

  /// Верхний угол
  @JsonKey(name: kUpperCorner)
  final String? upperCorner;
}
