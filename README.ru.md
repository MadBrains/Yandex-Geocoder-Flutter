<a href="https://madbrains.ru/?utm_source=gthb"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/banner.png?alt=media"></a>
<img align="left" src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/banner_geocoder.png?alt=media&token=59013dd3-f0c1-4f91-a1b9-37a9ca1b3066" width="480" height="360" /></a>

<h1 align="center">Flutter Yandex Geocoder</h1>

[![pub package](https://img.shields.io/pub/v/yandex_geocoder.svg)](https://pub.dartlang.org/packages/yandex_geocoder)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

[Read this in English](README.md)

Геокодер помогает определить координаты объекта по его адресу или, наоборот, установить адрес по координатам.

[Документация по API][documentation].

<a href="https://madbrains.ru/?utm_source=gthb">
<img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/get_started_stroke.png?alt=media" width="249" height="45"></a>
</p>

<p><h5>Subscribe for the latest updates:</h5>
<a href="https://github.com/MadBrains" >
<img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/follow_us_stroke.png?alt=media" width="138" height="26"></a></p>
</br>

## Возможности
* Прямое геокодирование. Используется для определения координат по названию объекта или его адресу. API учитывает распространенные опечатки и предлагает несколько подходящих вариантов. Например, можно преобразовать указанный пользователем адрес в координаты.
* Обратное геокодирование. Используется для определения адреса объекта по его координатам. Например, можно выбрать ближайший к точке на карте дом и получить его название.
* Выбор вида необходимого топонима.
* Ограничение поиска указанной областьи.
* Язык ответа и региональные особенности карты.

## Подключение
Для подключения добавьте в файл Pubspec зависимости:
```yaml
dependencies:
  yandex_geocoder: 2.3.0
```

## Использование
Для работы вам понадобятся **Api Key**, ключ для работы с Yandex API. Его можно получить в [личном кабинете разработчика][account].

```dart
final YandexGeocoder geocoder = YandexGeocoder(apiKey: 'Your Api Key');

final GeocodeResponse geocodeFromPoint = await geocoder.getGeocode(ReverseGeocodeRequest(
  pointGeocode: (55.771899, 37.597576),
));

final GeocodeResponse geocodeFromAddress = await geocoder.getGeocode(DirectGeocodeRequest(
  addressGeocode: 'Москва, 4-я Тверская-Ямская улица, 7',
));
```

## Пример работы
Пример работы SDK доступен в [Example][example]

[documentation]: https://yandex.ru/dev/maps/geocoder/doc/desc/concepts/about.html
[account]: https://developer.tech.yandex.ru/?from=geocoder
[example]: https://github.com/MadBrains/Yandex-Geocoder-Flutter/tree/main/example/