import 'package:flutter_test/flutter_test.dart';

import 'package:yandex_geocoder/yandex_geocoder.dart';

void main() {
  final YandexGeocoder geo =
      YandexGeocoder(apiKey: 'Your Api Key');

  test('latLong to Address', () async {
    final GeocodeResponse geocode = await geo.getGeocode(GeocodeRequest(
      geocode: PointGeocode(latitude: 55.771899, longitude: 37.597576),
    ));

    expect(
      geocode.firstAddress.formatted,
      'Россия, Москва, 4-я Тверская-Ямская улица, 7',
    );
  });
}
