<h1 align="center">Flutter Yandex Geocoder</h1>

<a href="https://madbrains.ru/"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/logo.png?alt=media" width="200" align="right" style="margin: 20px;"/></a>

[Read this in Russian](README.ru.md)

The geocoder helps to determine the coordinates of an object by its address or, conversely, to set the address by its coordinates.

[Available API Documentation][documentation].

## SDK Features
* Direct geocoding. Used to determine coordinates by object name or address. The API takes into account common misprints and offers several suitable variants. For example, you can convert a user-specified address into coordinates.
* Reverse geocoding. It is used to determine the address of an object by its coordinates. For example, you can select the nearest house on the map and get its name.
* Choosing the type of toponym you need.
* Restrict the search to a specified area.
* Answer language and regional features of the map.

## Installing
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  yandex_geocoder: 1.0.0
```

## Usage
To work you will need **Api Key**, a key to work with Yandex API. It can be obtained in the [personal account of developer][account].

```dart
final YandexGeocoder geocoder = YandexGeocoder(apiKey: 'Your Api Key');

final GeocodeResponse geocodeFromPoint = await geocoder.getGeocode(GeocodeRequest(
      geocode: PointGeocode(latitude: 55.771899, longitude: 37.597576),
      lang: Lang.enEn,
    ));

final GeocodeResponse geocodeFromAddress = await geocoder.getGeocode(GeocodeRequest(
      geocode: AddressGeocode(address: 'Moscow, 4th Tverskaya-Yamskaya street, 7'),
      lang: Lang.enEn,
    ));
```

## Example
The [Example][example] is in the corresponding folder

[documentation]: https://yandex.ru/dev/maps/geocoder/doc/desc/concepts/about.html
[account]: https://developer.tech.yandex.ru/?from=geocoder
[example]: https://github.com/MadBrains/Yandex-Geocoder-Flutter/tree/main/example/