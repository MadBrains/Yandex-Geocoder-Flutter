import 'models/models.dart';
import 'utils/network_client.dart' as network;

/// {@template yandex_geocode}
/// Сервис Яндекс.Карты предоставляет доступ к HTTP API Геокодера.
/// Этот API позволяет определять координаты топонима по его адресу,
/// или адрес точки по её координатам. Например, с помощью этого API можно определить зону доставки по введенному пользователем адресу.
///
/// Виды геокодирования:
/// - Прямое геокодирование используется для определения координат по названию объекта или его адресу.
/// API учитывает распространенные опечатки и предлагает несколько подходящих вариантов.
/// Например, можно преобразовать указанный пользователем адрес в координаты.
///
/// - Обратное геокодирование используется для определения адреса объекта по его координатам.
/// Например, можно выбрать ближайший к точке на карте дом и получить его название.
/// {@endtemplate}
class YandexGeocoder {
  /// {@macro yandex_geocode}
  factory YandexGeocoder({
    required String apiKey,
  }) {
    return YandexGeocoder._(apiKey: apiKey);
  }

  /// Используется если вы создали модель через [GeocodeRequest.withKey]
  ///
  /// {@macro yandex_geocode}
  factory YandexGeocoder.keyless() {
    return YandexGeocoder._();
  }

  YandexGeocoder._({
    this.apiKey,
  });

  /// Ключ, полученный в Кабинете разработчика
  final String? apiKey;

  /// Запрос на получение геокодирования
  Future<GeocodeResponse> getGeocode(GeocodeRequest geocode) {
    final bool _checkKey = geocode.apiKey?.isNotEmpty == true;

    if (apiKey?.isEmpty == true) {
      assert(_checkKey, 'The key cannot be empty!');
    }

    return network.getGeocode(
      request: _checkKey ? geocode : geocode.withKey(apiKey!),
      response: GeocodeResponse.fromJson,
      error: Error.fromJson,
    );
  }
}
