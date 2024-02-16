<a href="https://madbrains.ru/?utm_source=gthb"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/banner.png?alt=media"></a>
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/banner_geocoder.png?alt=media&token=59013dd3-f0c1-4f91-a1b9-37a9ca1b3066" width="480" height="360" /></a>

<h1 align="center">Flutter Yandex Geocoder</h1>

[![pub package](https://img.shields.io/pub/v/yandex_geocoder.svg)](https://pub.dartlang.org/packages/yandex_geocoder)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

[Read this in Russian](README.ru.md)

The geocoder helps to determine the coordinates of an object by its address or, conversely, to set the address by its coordinates.

[Available API Documentation][documentation].

<a href="https://madbrains.ru/?utm_source=gthb">
<img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/get_started_stroke.png?alt=media" width="249" height="45"></a>
</p>

<p><h5>Subscribe for the latest updates:</h5>
<a href="https://github.com/MadBrains" >
<img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/follow_us_stroke.png?alt=media" width="138" height="26"></a></p>
</br>

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
  yandex_geocoder: 2.3.0
```

## Usage
To work you will need **Api Key**, a key to work with Yandex API. It can be obtained in the [personal account of developer][account].

```dart
final YandexGeocoder geocoder = YandexGeocoder(apiKey: 'Your Api Key');

final GeocodeResponse geocodeFromPoint = await geocoder.getGeocode(ReverseGeocodeRequest(
    pointGeocode: (55.771899,37.597576),
    lang: Lang.enEn,
));

final GeocodeResponse geocodeFromAddress = await geocoder.getGeocode(DirectGeocodeRequest(
    addressGeocode: 'Moscow, 4th Tverskaya-Yamskaya street, 7',
    lang: Lang.enEn,
));
```

## Example
The [Example][example] is in the corresponding folder

[documentation]: https://yandex.ru/dev/maps/geocoder/doc/desc/concepts/about.html
[account]: https://developer.tech.yandex.ru/?from=geocoder
[example]: https://github.com/MadBrains/Yandex-Geocoder-Flutter/tree/main/example/