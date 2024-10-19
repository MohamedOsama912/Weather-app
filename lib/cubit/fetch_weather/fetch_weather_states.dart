import 'package:weather/models/weather_model.dart';

class WeatherStates {}
class CompleteWeather extends WeatherStates{
  final WeatherModel weather_model;

  CompleteWeather({required this.weather_model});
}
class NoWeather extends WeatherStates{}
class WeatherFailure extends WeatherStates{}