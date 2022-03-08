import 'package:flutter/material.dart';
import 'package:weather/CurrentWeather.dart';
import 'package:weather/model/NewReponse.dart';

import 'network/WeatherReponse.dart';

void main() {
  runApp(const MyApp());
}

Future<void> initialize() async {

}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String _title = 'Weather';
  @override
  Widget build(BuildContext context) {
    String title = _title;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CurrentWeatherPager());

  }
}

