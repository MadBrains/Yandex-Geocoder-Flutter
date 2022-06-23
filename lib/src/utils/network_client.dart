import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/models.dart';

/// Запрос на получение геокодирования
Future<GeocodeResponse> getGeocode({
  required GeocodeRequest request,
  required GeocodeResponse Function(Map<String, dynamic> json) response,
  required Error Function(Map<String, dynamic> json) error,
}) {
  final Completer<GeocodeResponse> _completer = Completer<GeocodeResponse>();
  http
      .get(Uri.https(kApiAuthority, kApiPath, request.toJson()))
      .then((http.Response rawResponse) {
        if (rawResponse.statusCode == 200) {
          final dynamic json = jsonDecode(rawResponse.body);

          _completer.complete(response(json as Map<String, dynamic>));
        } else if (rawResponse.statusCode >= 400 &&
            rawResponse.statusCode < 500) {
          final dynamic json = jsonDecode(rawResponse.body);

          _completer.completeError(error(json as Map<String, dynamic>));
        } else {
          _completer.completeError(rawResponse);
        }
      })
      .timeout(kRequestTimeLimit)
      .catchError((Object error) {
        _completer.completeError(error);
      });

  return _completer.future;
}
