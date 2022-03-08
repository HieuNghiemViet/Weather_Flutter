import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/WeatherListViewVertical.dart';
import 'package:weather/constant/constant.dart';
import 'package:weather/constant/string.dart';
import 'package:weather/model/NewReponse.dart';
import 'WeatherListViewHorizontal.dart';
import 'constant/text_style.dart';

class CurrentWeatherPager extends StatefulWidget {
  const CurrentWeatherPager({Key? key}) : super(key: key);

  @override
  _CurrentWeatherPagerState createState() => _CurrentWeatherPagerState();
}

class _CurrentWeatherPagerState extends State<CurrentWeatherPager> {
  late NewResponse _newResponse;

  fetchData() async {
    Dio _dio = Dio();
    Response response = await _dio.get(URL);

    setState(() {
      _newResponse = NewResponse.fromJson(response.data);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Stack(
            children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  pathImageBgr,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: kBorderRadius,
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          assets +
                              _newResponse.list![0].weather![0].icon
                                  .toString() +
                              png, // fix constant
                          height: 150,
                          width: 100,
                        ),
                        Text(
                          _newResponse.list![0].weather![0].description
                              .toString(),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Text(_newResponse.city!.name.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            _newResponse.list![0].main!.temp!
                                    .toInt()
                                    .toString() +
                                '°C',
                            style:
                                TextStyle(color: Colors.white, fontSize: 50)),
                        Text(
                            'Feels like ' +
                                _newResponse.list![0].main!.feelsLike!
                                    .toString() +
                                '°',
                            style: kSmallWhiteTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 90,
            child: Card(
              margin: kEdgeInsets,
              shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Wind', style: kSmallGreyTextStyle),
                      Text(
                          _newResponse.list![0].wind!.speed!.toString() +
                              ' km/h',
                          style: kSmallBlackTextStyle),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Humidity', style: kSmallGreyTextStyle),
                      Text(
                          _newResponse.list![0].main!.humidity!.toString() +
                              '%',
                          style: kSmallBlackTextStyle),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Pressure', style: kSmallGreyTextStyle),
                      Text(
                          _newResponse.list![0].main!.pressure!.toString() +
                              ' hPa',
                          style: kSmallBlackTextStyle),
                    ],
                  )
                ],
              ),
            ),
          ),
          WeatherByHour(_newResponse),
          WeatherByDay(_newResponse),
        ],
      ),
    );
  }
}




