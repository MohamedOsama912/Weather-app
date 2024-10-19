import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/fetch_weather/fetch_weather_cubit.dart';
import 'package:weather/cubit/fetch_weather/fetch_weather_states.dart';
import 'package:weather/views/search_page.dart';
import 'package:weather/views/weather_info.dart';

import 'empty_weather.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         // backgroundColor: Colors.blue,
          title: const Text(
            'Weather Today',
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const SearchPage();
                    },
                  ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is CompleteWeather) {
              return WeatherPageInfo(weather_model: state.weather_model,);
            } else if (state is NoWeather)
              return const EmptyWeather();
            else
              return const Text('errrrrooooooooooooooooooooor');
          },
        ));
  }
}
