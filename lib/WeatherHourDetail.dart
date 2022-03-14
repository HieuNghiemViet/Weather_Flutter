import 'package:flutter/material.dart';
import 'package:weather/CurrentWeatherPager.dart';

class WeatherHourDetail extends StatelessWidget {
  const WeatherHourDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textButton = 'Call Back';
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
            textButton,
            style: TextStyle(color: Colors.black54),
          ),
        ),
      )
    );
  }
}


