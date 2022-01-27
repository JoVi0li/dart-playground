import 'dart:convert';

class ClimateModel {
  final String country;
  final String date;
  final String text;
  
  ClimateModel({
    required this.country,
    required this.date,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'date': date,
      'text': text,
    };
  }

  factory ClimateModel.fromMap(Map<String, dynamic> map) {
    return ClimateModel(
      country: map['country'] ?? '',
      date: map['date'] ?? '',
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClimateModel.fromJson(String source) => ClimateModel.fromMap(json.decode(source));
}
