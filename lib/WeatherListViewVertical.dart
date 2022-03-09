import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/DateHelper.dart';
import 'constant/string.dart';
import 'model/NewReponse.dart';

Widget WeatherByDay(NewResponse _newResponse) {
  return Expanded(
    child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
        itemCount: _newResponse.list?.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
            margin: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "${DateHelper.getDateFromTimestamp(_newResponse.list![index].dt!.toInt())}",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )),
                Expanded(
                  child: Image.asset(
                      DefineString.assets +
                          _newResponse.list![index].weather![0].icon
                              .toString() +
                          DefineString.png,
                      height: 70,
                      width: 70),
                ),
                Expanded(
                  child: Text(
                    _newResponse.list![index].main!.tempMin!.toString() +
                        ' / ' +
                        _newResponse.list![index].main!.tempMax!.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                )
              ],
            ),
          );
        }),
  );
}


