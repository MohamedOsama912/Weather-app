import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Dio dio;
  WeatherService({required this.dio});

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      // make base url & api key
      const url = 'https://api.weatherapi.com/v1';
      const apiKey = 'f8b7a70e5e7e45d1bc9174409242609';
      // now we getting the data
      Response response =
          await dio.get('$url/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel = WeatherModel.json(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'null data';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('An unexpected error occurred');
    }
  }
}
