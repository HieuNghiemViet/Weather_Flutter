import 'package:flutter/material.dart';
import 'package:weather/CurrentWeatherPager.dart';

class WeatherHourDatail extends StatelessWidget {
  const WeatherHourDatail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child:  Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white, // background
              onPrimary: Colors.red // foreground
          ),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Text(
            'Call Back',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      )
    );
  }
}


