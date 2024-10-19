import 'dart:ffi';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double minTemp;
  final double avgTemp;
  final double maxTemp;
  final String airState;

  WeatherModel(
      {required this.date,
      required this.cityName,
      required this.airState,
      required this.maxTemp,
      required this.minTemp,
      this.image,
      required this.avgTemp});

  factory WeatherModel.json(json) {
    return WeatherModel(
        date: DateTime.parse(json['current']['last_updated']),
        cityName: json['location']['name'],
        airState: json['current']['condition']['text'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        image: json['current']['condition']['icon']);
  }
}
