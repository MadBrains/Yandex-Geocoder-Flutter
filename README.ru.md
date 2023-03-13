<h1 align="center">Flutter Yandex Geocoder</h1>

<a href="https://madbrains.ru/"><img src="https://firebasestorage.googleapis.com/v0/b/mad-brains-web.appspot.com/o/logo.png?alt=media" width="200" align="right" style="margin: 20px;"/></a>

[![pub package](https://img.shields.io/pub/v/yandex_geocoder.svg)](https://pub.dartlang.org/packages/yandex_geocoder)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

[Read this in English](README.md)

Геокодер помогает определить координаты объекта по его адресу или, наоборот, установить адрес по координатам.

[Документация по API][documentation].

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
  yandex_geocoder: 2.2.0-dev.1
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