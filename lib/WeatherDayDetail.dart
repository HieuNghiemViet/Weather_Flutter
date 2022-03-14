import 'package:flutter/material.dart';
import 'package:weather/CurrentWeatherPager.dart';
import 'package:weather/WeatherHourDetail.dart';
import 'package:weather/constant/string.dart';
import 'package:weather/model/List.dart';
import 'package:weather/model/NewReponse.dart';
import 'constant/constant.dart';
import 'constant/string.dart';
import 'constant/text_style.dart';

class WeatherDayDetail extends StatelessWidget {
  late InfomationWeather infomationWeather;

  @override
  Widget build(BuildContext context) {
    infomationWeather =
        ModalRoute.of(context)!.settings.arguments as InfomationWeather;

    return Container(
      padding: EdgeInsets.fromLTRB(30, 50, 20, 0),
      color: Colors.lightBlueAccent,
      child: Column(
        children: [
          setImageIcon(),
          GestureDetector(
              onTap: () => {
                    Navigator.pushNamed(
                        context,
                    '/hour_detail')
                  },
              child: infoTempFeelslike()),
          infoWindHumidityPre(),
          infoSeaLevelGrndLevel(),
        ],
      ),
    );
  }

  Widget setImageIcon() {
    return Image.asset(
        DefineString.assets +
            infomationWeather.weather!.first.icon.toString() +
            DefineString.png,
        fit: BoxFit.fill);
  }

  Widget infoTempFeelslike() {
    return Container(
      height: 90,
      child: Card(
        margin: Constant.kEdgeInsets,
        shape: RoundedRectangleBorder(borderRadius: Constant.kBorderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Temp', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.main!.temp!.toInt().toString() + '°C',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Humidity', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.main!.humidity!.toString() + '%',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Pressure', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.main!.pressure!.toString() + ' hPa',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget infoWindHumidityPre() {
    return Container(
      height: 90,
      child: Card(
        margin: Constant.kEdgeInsets,
        shape: RoundedRectangleBorder(borderRadius: Constant.kBorderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Wind', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.wind!.speed!.toString() + ' km/h',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Feels like', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.main!.feelsLike.toString() + '°',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Visibility', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.visibility.toString() + ' m',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget infoSeaLevelGrndLevel() {
    return Container(
      height: 90,
      child: Card(
        margin: Constant.kEdgeInsets,
        shape: RoundedRectangleBorder(borderRadius: Constant.kBorderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Sea Level', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.main!.seaLevel.toString() + ' hPa',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Grnd Level', style: StyleText.kSmallGreyTextStyle),
                Text(infomationWeather.main!.grndLevel.toString() + ' hPa',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
