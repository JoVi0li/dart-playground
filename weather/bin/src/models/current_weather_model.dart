import 'dart:convert';

class CurrentWeatherModel {
  final int id;
  final String name;
  final String country;
  final Map<String, dynamic> data;
  
  CurrentWeatherModel({
    required this.id,
    required this.name,
    required this.country,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'data': data,
    };
  }

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      country: map['country'] ?? '',
      data: Map<String, dynamic>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherModel.fromJson(String source) => CurrentWeatherModel.fromMap(json.decode(source));
}
