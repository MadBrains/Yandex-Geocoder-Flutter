import 'package:json_annotation/json_annotation.dart';

/// {@template kind_response}
/// Вид топонима.
/// {@endtemplate}
enum KindResponse {
  /// дом
  @JsonValue('house')
  house,

  /// улица
  @JsonValue('street')
  street,

  /// станция метро
  @JsonValue('metro')
  metro,

  /// район города
  @JsonValue('district')
  district,

  /// населенный пункт (город/поселок/деревня/село/...)
  @JsonValue('locality')
  locality,

  /// страна
  @JsonValue('country')
  country,

  /// провинция
  @JsonValue('province')
  province,

  /// площадь
  @JsonValue('area')
  area,

  /// hydro
  @JsonValue('hydro')
  hydro,

  /// hydro
  @JsonValue('unknown')
  unknown,
}
