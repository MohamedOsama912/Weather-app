import 'package:flutter/material.dart';

class EmptyWeather extends StatelessWidget {
  const EmptyWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          'welcome to Weather App, please click on search icon to know the weather in your city',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}