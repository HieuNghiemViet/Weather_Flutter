import 'package:flutter/material.dart';
import 'package:weather/CurrentWeatherPager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather/Login.dart';
import 'package:weather/WeatherDayDetail.dart';
import 'package:weather/WeatherHourDetail.dart';
import 'package:weather/WeatherListViewHorizontal.dart';
import 'package:weather/model/List.dart';
import 'package:weather/model/NewReponse.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(const MyApp());
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
        home: CurrentWeatherPager());
    //Login());

    //
  }
}
