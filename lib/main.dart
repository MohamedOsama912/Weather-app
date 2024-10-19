import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/fetch_weather/fetch_weather_cubit.dart';
import 'package:weather/cubit/fetch_weather/fetch_weather_states.dart';
import 'package:weather/views/first_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(

                  primarySwatch: getWeatherColor(
                      BlocProvider.of<WeatherCubit>(context)
                          .weatherModel
                          ?.airState),
                useMaterial3: false,
              ),
              debugShowCheckedModeBanner: false,
              home: const WelcomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) return Colors.blue; // Default or unknown state

  switch (weatherCondition.toLowerCase()) {
    case 'sunny':
      return Colors.orange; // This is a MaterialColor
    case 'partly cloudy':
    case 'cloudy':
      return Colors.blueGrey; // This is a MaterialColor
    case 'overcast':
    case 'mist':
      return Colors.grey; // This is a MaterialColor
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
      return Colors.blue; // This is a MaterialColor
    case 'light snow':
    case 'moderate snow':
      return Colors.lightBlue; // This is a MaterialColor
    case 'thunderstorms':
      return Colors.purple; // This is a MaterialColor
    default:
      return Colors.blue; // Default or unknown state, returning a MaterialColor
  }
}
