import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../src/interfaces/http_client_interface.dart';
import '../../src/services/clima_tempo_api.dart';
import '../../src/services/dio_client.dart';

class DioClientMock extends Mock implements DioClient {}

class ClimaTempoApiServiceMock extends ClimaTempoApiService {
  ClimaTempoApiServiceMock(IHttpClient httpClient) : super(httpClient);
}

void main() {
  
  group('ClimaTempoApiService', () {
    final dioMock = DioClientMock();
    final climaService = ClimaTempoApiServiceMock(dioMock);

    test('deve retornar uma instância de CurrentWeatherModel', () async {
      final data = ''' {
        "id": 3477,
        "name": "São Paulo",
        "state": "SP",
        "country": "BR  ",
        "data": {
            "temperature": 22,
            "wind_direction": "SSW",
            "wind_velocity": 20,
            "humidity": 83,
            "condition": "Pancada de chuva",
            "pressure": 1012,
            "icon": "4",
            "sensation": 22,
            "date": "2022-01-28 13:52:30"
        }
      }''';

      final response = Response(
        requestOptions: RequestOptions(path: ''),
        data: data,
      );

      when(() => dioMock.get(any())).thenAnswer((_) async => response);

      final currentWeather = await climaService.currentWeather();

      expect(currentWeather.data['temperature'], 22);
    });

    test('deve retornar uma instância de ClimateModel', () async {
      final data = '''{
            "country": "BR",
            "date": "2022-01-28",
            "text": "Muito Frio"
        }
      ''';

      final response = Response(
        requestOptions: RequestOptions(path: ''),
        data: data,
      );

      when(() => dioMock.get(any())).thenAnswer((_) async => response);

      final climate = await climaService.getCountryClimate('BR');

      expect(climate.date, '2022-01-28');
    });
  });
}


