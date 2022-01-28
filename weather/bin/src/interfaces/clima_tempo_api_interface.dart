import '../models/climate_model.dart';
import '../models/current_weather_model.dart';

abstract class IClimaTempoApiService {

  //Retorna o texto de análise sinótica para o país fornecido.
  Future<ClimateModel> getCountryClimate(String country);

  //Retorna o texto de informações referentes ao clima para a cidade fornecida.
  Future<CurrentWeatherModel> currentWeather();
}
