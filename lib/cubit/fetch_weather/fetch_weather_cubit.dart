import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/fetch_weather/fetch_weather_states.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class WeatherCubit extends Cubit <WeatherStates>
{
  WeatherCubit() : super(NoWeather());
  WeatherModel? weatherModel;
  FetchWeather(value) async
  {
    try {
        weatherModel = await WeatherService(dio: Dio()).getWeather(cityName: value);
      emit(CompleteWeather(weather_model: weatherModel!));
    } catch (e) {
      emit(WeatherFailure());
    }

  }

}