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
  String _toKind() {
    switch (this) {
      case KindRequest.house:
        return 'house';
      case KindRequest.street:
        return 'street';
      case KindRequest.metro:
        return 'metro';
      case KindRequest.district:
        return 'district';
      case KindRequest.locality:
      default:
        return 'locality';
    }
  }
}
