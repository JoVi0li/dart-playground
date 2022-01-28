import 'dart:io';

import '../interfaces/weather_controller_interface.dart';
import '../interfaces/weather_view_interface.dart';

class WeatherView implements IWeatherView {
  WeatherView(this.controller);
  final IWeatherController controller;

  @override
  void countryClimateNow(String country) async {
    final climate = await controller.countryClimateNow(country);

    stdout.write(''' 
      Aqui está a análise sinótica para o país fornecido
      //////////////////////////////////////////////////
      País: ${climate.country}
      ///
      Data: ${climate.date}
      ///
      Análise: ${climate.text}
      //////////////////////////////////////////////////
      Obrigado por usar nosso sistema!
      //////////////////////////////////////////////////
    ''');

    showServices();
  }

  @override
  void currentWeatherNow() async {
    final currentWeather = await controller.currentWeatherNow();

    stdout.write(''' 
      Aqui estão as informações referentes ao clima para a cidade de São Paulo
      //////////////////////////////////////////////////
      País: ${currentWeather.country}
      ///
      Cidade: ${currentWeather.name}
      ///
      Data da consulta: ${currentWeather.data['date']}
      ///
      Informações: {
        Temperatura: ${currentWeather.data['temperature']}
        Direção do vento: ${currentWeather.data['wind_direction']}
        Velocidade do vento: ${currentWeather.data['wind_velocity']}
        Umidade: ${currentWeather.data['humidity']}
        Condição: ${currentWeather.data['condition']}
        Pressão: ${currentWeather.data['pressure']}
        Sensação térmica: ${currentWeather.data['sensation']}
      }
      //////////////////////////////////////////////////
      Obrigado por usar nosso sistema!
      //////////////////////////////////////////////////
    ''');

    showServices();
  }

  @override
  void welcome() {
    stdout.write('''
      Olá, bem-vindo ao Sistema de Previsão do Tempo!
      //////////////////////////////////////////////////
      Trata-se de um sistema de console onde é possível
      que o usuário confira informações sobre o clima
      referentes a um país ou sobre a ciade de São Paulo.
      //////////////////////////////////////////////////
      Para obter informações mais detalhadas, confira o 
      README do projeto, obrigado!
      //////////////////////////////////////////////////
    ''');

    showServices();
  }

  @override
  void showServices() {
    int service = 0;
    String country = '';
    stdout.write('''
      Estes são os servições disponíveis:
      //////////////////////////////////////////////////
      1. Clima Atual (São Paulo)
      2. Previsão do Diao (País)
      //////////////////////////////////////////////////
      Para selecionar, digite o número do serviço:
    ''');

    service = int.parse(stdin.readLineSync()!);

    switch (service) {
      case 1:
        currentWeatherNow();
        break;
      case 2:
        stdout.write('Ok! Informe o país, exemplo: BR .');
        country = stdin.readLineSync()!;
        countryClimateNow(country);
        break;
      default:
    }
  }
}
