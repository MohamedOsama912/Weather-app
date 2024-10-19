import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/fetch_weather/fetch_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Center(
            child: TextField(
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            hintText: 'enter city name',
            labelText: 'city',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) async {
            var cubitBoy = BlocProvider.of<WeatherCubit>(context);
            cubitBoy.FetchWeather(value);
            Navigator.pop(context);
          },
        )),
      ),
    );
  }
}
