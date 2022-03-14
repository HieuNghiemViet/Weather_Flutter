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
  final NewResponse newResponse;
  int? index;

  WeatherDayDetail(this.newResponse, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 50, 20, 0),
      color: Colors.lightBlueAccent,
      child: Column(
        children: [
          setImageIcon(newResponse, index!),
          GestureDetector(
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherHourDatail()))
                  },
              child: infoTempFeelslike(newResponse, index!)),
          infoWindHumidityPre(newResponse, index!),
          infoSeaLevelGrndLevel(newResponse, index!),
        ],
      ),
    );
  }
}

Widget setImageIcon(NewResponse _newResponse, int index) {
  return Image.asset(DefineString.assets +
      _newResponse.list![index].weather![0].icon.toString() +
      DefineString.png, fit: BoxFit.fill);
}

Widget infoTempFeelslike(NewResponse _newResponse, int index) {
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
              Text(
                  _newResponse.list![index].main!.temp!.toInt().toString() +
                      '°C',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Humidity', style: StyleText.kSmallGreyTextStyle),
              Text(_newResponse.list![index].main!.humidity!.toString() + '%',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Pressure', style: StyleText.kSmallGreyTextStyle),
              Text(
                  _newResponse.list![index].main!.pressure!.toString() + ' hPa',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          )
        ],
      ),
    ),
  );
}

Widget infoWindHumidityPre(NewResponse _newResponse, int index) {
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
              Text(_newResponse.list![index].wind!.speed!.toString() + ' km/h',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Feels like', style: StyleText.kSmallGreyTextStyle),
              Text(_newResponse.list![index].main!.feelsLike.toString() + '°',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Visibility', style: StyleText.kSmallGreyTextStyle),
              Text(_newResponse.list![index].visibility.toString() + ' m',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          )
        ],
      ),
    ),
  );
}

Widget infoSeaLevelGrndLevel(NewResponse _newResponse, int index) {
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
              Text(_newResponse.list![index].main!.seaLevel.toString() + ' hPa',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Grnd Level', style: StyleText.kSmallGreyTextStyle),
              Text(
                  _newResponse.list![index].main!.grndLevel.toString() + ' hPa',
                  style: StyleText.kSmallBlackTextStyle),
            ],
          ),
        ],
      ),
    ),
  );
}
