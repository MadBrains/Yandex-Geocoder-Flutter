// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodeResponse _$GeocodeResponseFromJson(Map<String, dynamic> json) =>
    GeocodeResponse(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      geoObjectCollection: json['GeoObjectCollection'] == null
          ? null
          : GeoObjectCollection.fromJson(
              json['GeoObjectCollection'] as Map<String, dynamic>),
    );
