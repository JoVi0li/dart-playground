import 'package:dio/dio.dart';

import 'src/controllers/weather_controller.dart';
import 'src/interfaces/clima_tempo_api_interface.dart';
import 'src/interfaces/http_client_interface.dart';
import 'src/interfaces/weather_controller_interface.dart';
import 'src/interfaces/weather_view_interface.dart';
import 'src/services/clima_tempo_api.dart';
import 'src/services/dio_client.dart';
import 'src/view/weather_view.dart';

void main(List<String> arguments) async {
  final Dio dio = Dio();
  final IHttpClient httpClient = DioClient(dio);
  final IClimaTempoApiService service = ClimaTempoApiService(httpClient);
  final IWeatherController controller = WeatherController(service);
  final IWeatherView view = WeatherView(controller);

  var result = await controller.countryClimateNow("BR");

  print(result);
}
