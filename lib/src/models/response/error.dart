import 'package:json_annotation/json_annotation.dart';

import '../../constants.dart';
import '../../utils/comparer.dart';

part 'error.g.dart';

@JsonSerializable(createToJson: false)

/// {@template error}
/// Модель ошибки
/// {@endtemplate}
class Error with Comparer {
  /// {@macro error}
  Error({
    this.statusCode,
    this.error,
    this.message,
  });

  /// Преобразование json в модель
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        kStatusCode: statusCode,
        kError: error,
        kMessage: message,
      };

  /// Статус код
  @JsonKey(name: kStatusCode)
  final int? statusCode;

  /// Ошибка
  @JsonKey(name: kError)
  final String? error;

  /// Сообщение
  @JsonKey(name: kMessage)
  final String? message;
}
