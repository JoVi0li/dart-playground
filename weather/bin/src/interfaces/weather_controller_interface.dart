import '../models/climate_model.dart';
import '../models/current_weather_model.dart';

abstract class IWeatherController {
  Future<ClimateModel> countryClimateNow(String country);

  Future<CurrentWeatherModel> currentWeatherNow();
}
