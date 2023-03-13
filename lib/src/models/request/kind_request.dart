part of 'request.dart';

/// {@template kind_request}
/// Вид необходимого топонима.
///
/// Только если в параметре [geocode] указаны координаты.
/// {@endtemplate}
enum KindRequest {
  /// дом
  house,

  /// улица
  street,

  /// станция метро
  metro,

  /// район города
  district,

  /// населенный пункт (город/поселок/деревня/село/...)
  locality,
}

/// extension for Kind
extension _KindX on KindRequest {
  String _toKind() => switch (this) {
    KindRequest.house => 'house',
    KindRequest.street =>'street',
    KindRequest.metro =>'metro',
    KindRequest.district =>'district',
    KindRequest.locality => 'locality'
  };
}
