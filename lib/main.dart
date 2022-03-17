import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/ExampleStream.dart';
import 'package:weather/exampleBloC/ExampleStreamBloC.dart';
import 'package:weather/network/CurrentWeatherCubit.dart';
import 'CurrentWeatherPager.dart';
import 'WeatherDayDetail.dart';
import 'WeatherHourDetail.dart';

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
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CurrentWeatherCubit(),
        child: CurrentWeatherPager(),
      ),
    );
    //ExampleStream());
    //Login());
  }
}
