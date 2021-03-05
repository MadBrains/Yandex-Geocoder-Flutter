// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    pos: json['pos'] as String?,
  );
}

BoundedBy _$BoundedByFromJson(Map<String, dynamic> json) {
  return BoundedBy(
    envelope: json['Envelope'] == null
        ? null
        : Envelope.fromJson(json['Envelope'] as Map<String, dynamic>),
  );
}

Envelope _$EnvelopeFromJson(Map<String, dynamic> json) {
  return Envelope(
    lowerCorner: json['lowerCorner'] as String?,
    upperCorner: json['upperCorner'] as String?,
  );
}
