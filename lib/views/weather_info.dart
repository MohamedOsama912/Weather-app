import 'package:flutter/material.dart';
import 'package:weather/cubit/fetch_weather/fetch_weather_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';
class WeatherPageInfo extends StatelessWidget {
  const WeatherPageInfo({super.key, required this.weather_model});
  final WeatherModel weather_model;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Weather App'),
      //   backgroundColor: Colors.blue,
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                getWeatherColor(weather_model.airState)[500]!,
                getWeatherColor(weather_model.airState)[300]!,
                getWeatherColor(weather_model.airState)[200]!,
                getWeatherColor(weather_model.airState)[50]!,
              ]
          )
        ),
        child: Center(
          child: Padding(
            padding:  const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weather_model.cityName,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                 Text(
                  'updated at ${weather_model.date.hour}:${weather_model.date.minute}',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                  SizedBox(height: 20),
               Image.network(
                   'https:${weather_model.image}' ,
                   width: 100
               ), // Weather icon
                Text(
                  weather_model.avgTemp.toString(),
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                ),
                 const SizedBox(height: 10),
                Text(
                  weather_model.airState,
                  style: const TextStyle(fontSize: 25),
                ),
                 const SizedBox(height: 20),
                Text(
                  'maxTemp : ${weather_model.maxTemp.toString() }   minTemp : ${weather_model.minTemp.toString()}' ,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}