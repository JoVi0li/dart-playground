import '../interfaces/clima_tempo_api_interface.dart';
import '../interfaces/http_client_interface.dart';
import '../models/current_weather_model.dart';
import '../models/climate_model.dart';

class ClimaTempoApiService implements IClimaTempoApiService {
  ClimaTempoApiService(this._httpClient);

  final IHttpClient _httpClient;
  final String apiKey = '166796442956a5a8bb031b869e1007d6';

  @override
  Future<CurrentWeatherModel> currentWeather() async {
    final String url =
        'http://apiadvisor.climatempo.com.br/api/v1/weather/locale/3477/current?token=$apiKey';

    final data = await _httpClient.get(url);

    return CurrentWeatherModel.fromMap(data);
  }

  @override
  Future<ClimateModel> getCountryClimate(String country) async {
    final String url =
        'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/$country?token=$apiKey';

    final data = await _httpClient.get(url);

    return ClimateModel.fromMap(data);
  }
}
