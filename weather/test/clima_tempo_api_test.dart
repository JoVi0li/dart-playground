import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:mocktail/mocktail.dart';
import "package:test/test.dart";

class HttpClientServiceMock extends Mock implements DioForNative {}

void main() {
  test('deve retornar as informações referentes ao clima do país', () async {
    final HttpClientServiceMock httpClient = HttpClientServiceMock();
    final String tokenApi = "166796442956a5a8bb031b869e1007d6";
    final String locale = "BR";
    final String url =
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/$locale?token=$tokenApi";
    final dataClimate = {
      "country": "BR",
      """text": "Uma frente fria avança sobre a costa do Sul do BR
        nesta quinta-feira. O alerta é de temporais principalmente 
        entre o norte do RS até o PR. Perigo para grandes volumes de
        chuva entre o litoral de SC e do PR. No Sudeste e Centro-Oeste,
        sol, calor e risco de temporais em SP, MS, GO, DF e leste e norte
        de MT. No Norte, alerta de temporais no TO, centro-sul e leste do
        PA, MA, PI e norte do CE. A proximidade da ZCIT na costa norte do
        BR reforça a instabilidade. """
          "date": "2022-01-27",
    };
    final response = Response(requestOptions: RequestOptions(path: ''));

    // when(() => httpClient.get(url)).thenAnswer(() async => response);

    expect("", 'matcher');
  });
}
