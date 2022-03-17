import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/text_style.dart';
import 'ExampleBloC/ExampleStream.dart';
import 'CurrentWeatherPager.dart';
import 'ExampleBloC/ExampleStream.dart';
import 'WeatherDayDetail.dart';
import 'WeatherHourDetail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String _title = 'Weather Hanoi';

  @override
  Widget build(BuildContext context) {
    String title = _title;
    return MaterialApp(
        routes: {
          '/home': (context) => CurrentWeatherPager(),
          '/day_detail': (context) => WeatherDayDetail(),
          '/hour_detail': (context) => WeatherHourDetail()
        },

        // onGenerateRoute: (settings) {
        //   if (settings.name == '/home') {
        //     final CurrentWeatherPager currentWeatherPager = settings.arguments;
        //   }
        // },

        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ExampleStream());
    //CurrentWeatherPager());
    //Login());

    //
  }
}
