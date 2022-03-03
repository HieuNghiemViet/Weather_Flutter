import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/WeatherListViewHorizontal.dart';
import 'package:weather/WeatherListViewVertical.dart';
import 'package:weather/model/NewReponse.dart';

class CurrentWeatherPager extends StatefulWidget {
  const CurrentWeatherPager({Key? key}) : super(key: key);

  @override
  _CurrentWeatherPagerState createState() => _CurrentWeatherPagerState();
}

class _CurrentWeatherPagerState extends State<CurrentWeatherPager> {
  final String _url =
      "https://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=28d3ee0a2527556a4f8779146404f1ac";

  late NewResponse newResponse;

  fetchData() async {
    Dio _dio = new Dio();
    Response response = await _dio.get(_url);

    setState(() {
      newResponse = NewResponse.fromJson(response.data);
      print('HieuNV: ' + newResponse.name.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var cels = ((newResponse.main!.temp!) - 273.15);
    var getSunrise =
        DateTime.fromMillisecondsSinceEpoch(newResponse.sys!.sunrise! * 1000);
    var getSunset =
        DateTime.fromMillisecondsSinceEpoch(newResponse.sys!.sunset! * 1000);

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
                  'assets/bgr.png',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
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
                          'assets/01d.png',
                          height: 150,
                          width: 100,
                        ),
                        Text(
                          newResponse.weather![0].description.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text(newResponse.name.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(cels.toString() + '°C',
                            style:
                                TextStyle(color: Colors.white, fontSize: 50)),
                        Text(
                            'Feels like ' +
                                newResponse.main!.feelsLike!.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 90,
            child: Card(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Wind', style: TextStyle(color: Colors.grey)),
                      Text(newResponse.wind!.speed!.toString() + ' km/h',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Humidity', style: TextStyle(color: Colors.grey)),
                      Text(newResponse.main!.humidity!.toString() + ' %',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Pressure', style: TextStyle(color: Colors.grey)),
                      Text(newResponse.main!.pressure!.toString() + ' hPa',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 90,
            child: Card(
              color: Colors.lightBlue[300],
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Pressure', style: TextStyle(color: Colors.grey)),
                      Text(newResponse.main!.pressure.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Visiblity', style: TextStyle(color: Colors.grey)),
                      Text(newResponse.visibility.toString() + ' km',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Sea lever', style: TextStyle(color: Colors.grey)),
                      Text(newResponse.main!.seaLevel.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 90,
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Sunrise', style: TextStyle(color: Colors.grey)),
                      Text(getSunrise.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Sunset', style: TextStyle(color: Colors.grey)),
                      Text(getSunset.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          WeatherByHour(),
          WeatherByDay(),
        ],
      ),
    );
  }
}

class WeatherByHour extends StatelessWidget {
  const WeatherByHour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Text(
            'Em còn listView horizaltal với vertical ở dưới nhưng khi làm xong e mới phát hiện ra call API 1 ngày nó k trả về theo giờ :((('
                'a cho e xin thêm thời gian để fix ạ',
            style: TextStyle(color: Colors.black54, fontSize: 20)),
      );
  }
}
