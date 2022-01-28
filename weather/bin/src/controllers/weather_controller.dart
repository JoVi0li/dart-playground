import '../interfaces/clima_tempo_api_interface.dart';
import '../interfaces/weather_controller_interface.dart';
import '../models/current_weather_model.dart';
import '../models/climate_model.dart';

class WeatherController implements IWeatherController {
  WeatherController(this.service);

  final IClimaTempoApiService service;

  @override
  Future<ClimateModel> countryClimateNow(String country) async {
    try {
      final ClimateModel climate = await service.getCountryClimate(country);
      return climate;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CurrentWeatherModel> currentWeatherNow() async {
    try {
      final CurrentWeatherModel currentWeather = await service.currentWeather();
      return currentWeather;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
