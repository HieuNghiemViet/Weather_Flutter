import 'package:flutter/material.dart';
import 'package:weather/CurrentWeatherPager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(const MyApp());
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
    //Login());

       //
  }
}

