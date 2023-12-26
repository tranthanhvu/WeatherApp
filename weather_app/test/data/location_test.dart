import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/src/data/location.dart';

void main() {
  group('Location', () {
    group('decode', () {
      test('creates Location object successfuly', () {
        expect(
            Location.fromJson(
              const <String, dynamic>{
                "id": 2717932,
                "name": "Hanoi",
                "region": "",
                "country": "Vietnam",
                "lat": 21.03,
                "lon": 105.85,
                "url": "hanoi-vietnam"
              },
            ),
            const Location(
              name: 'Hanoi',
              lat: 21.03,
              lon: 105.85,
              region: '',
              country: 'Vietnam',
            ));
      });
    });
  });
}
