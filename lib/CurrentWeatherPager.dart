import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/WeatherListViewVertical.dart';
import 'package:weather/constant/constant.dart';
import 'package:weather/constant/string.dart';
import 'package:weather/constant/text_style.dart';
import 'package:weather/model/NewReponse.dart';
import 'WeatherListViewHorizontal.dart';
import 'network/CurrentWeatherCubit.dart';

class CurrentWeatherPager extends StatefulWidget {
  const CurrentWeatherPager({Key? key}) : super(key: key);

  @override
  _CurrentWeatherPagerState createState() => _CurrentWeatherPagerState();
}

class _CurrentWeatherPagerState extends State<CurrentWeatherPager> {
  NewResponse? _newResponse;

  @override
  void initState() {
    BlocProvider.of<CurrentWeatherCubit>(context).fetchNewWeather();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () => BlocProvider.of<CurrentWeatherCubit>(context).fetchNewWeather(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather Hanoi', style: TextStyle(fontSize: 25)),
          backgroundColor: Colors.lightBlueAccent,
        ),
        backgroundColor: Colors.grey[300],
        body: BlocBuilder<CurrentWeatherCubit, NewResponse>(
          builder: (context, newResponse) {
            _newResponse = newResponse;
            if (newResponse.cod == null) {
              return Container();
            }
            return Column(
              children: [
                WeatherHanoi(_newResponse!),
                 WiHumiPre(_newResponse!),
                 WeatherByHour(newResponse: _newResponse!),
                 WeatherByDay(_newResponse!),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget WeatherHanoi(NewResponse _newResponse) {
    return Stack(
      children: [
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            DefineString.pathImageBgr,
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(borderRadius: Constant.kBorderRadius),
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
                    DefineString.assets +
                        _newResponse.list![0].weather![0].icon.toString() +
                        DefineString.png, // fix constant

                    height: 150,
                    width: 100,
                  ),
                  Text(
                    _newResponse.list![0].weather![0].description.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(_newResponse.city!.name.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      _newResponse.list![0].main!.temp!.toInt().toString() +
                          '°C',
                      style: TextStyle(color: Colors.white, fontSize: 50)),
                  Text(
                      'Feels like ' +
                          _newResponse.list![0].main!.feelsLike!.toString() +
                          '°',
                      style: StyleText.kSmallWhiteTextStyle),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget WiHumiPre(NewResponse _newResponse) {
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
                Text(_newResponse.list![0].wind!.speed!.toString() + ' km/h',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Humidity', style: StyleText.kSmallGreyTextStyle),
                Text(_newResponse.list![0].main!.humidity!.toString() + '%',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Pressure', style: StyleText.kSmallGreyTextStyle),
                Text(_newResponse.list![0].main!.pressure!.toString() + ' hPa',
                    style: StyleText.kSmallBlackTextStyle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
