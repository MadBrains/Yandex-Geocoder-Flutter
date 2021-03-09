import 'package:flutter/material.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final YandexGeocoder geo =
      YandexGeocoder(apiKey: 'Your Api Key');

  String address = 'null';
  String latLong = 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text('latitude: 37.597576, longitude: 55.771899'),
                Text(address),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: <Widget>[
                const Text('address: Москва, 4-я Тверская-Ямская улица, 7'),
                Text(latLong),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          address = 'null';
          latLong = 'null';
          setState(() {});

          final GeocodeResponse _address = await geo.getGeocode(GeocodeRequest(
            geocode: PointGeocode(latitude: 55.771899, longitude: 37.597576),
          ));
          address = _address.firstAddress.formatted;

          final GeocodeResponse _latLong = await geo.getGeocode(GeocodeRequest(
            geocode:
                AddressGeocode(address: 'Москва, 4-я Тверская-Ямская улица, 7'),
          ));
          latLong = _latLong.firstPoint.pos;

          setState(() {});
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
