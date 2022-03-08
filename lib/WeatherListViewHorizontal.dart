import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constant/string.dart';
import 'model/NewReponse.dart';

Widget WeatherByHour(NewResponse _newResponse) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 0.0),
    height: 150.0,
    child: ListView.builder(
      padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
      scrollDirection: Axis.horizontal,
      itemCount: _newResponse.list?.length,
      itemBuilder: (context, index) {
        return Container(
          padding:
              const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1), // changes position of shadow
              )
            ],
          ),
          child: Column(
            children: [
              Text(
                "${_newResponse.list![index].main!.temp}°",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black),
              ),
              Image.asset(
                assets +
                    _newResponse.list![index].weather![0].icon.toString() +
                    png, // fix constant
                height: 70,
                width: 70,
              ),
              Text(
                "${getTimeFromTimestamp(_newResponse.list![index].dt!.toInt())}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.grey),
              ),
            ],
          ),
        );
      },
    ),
  );
}

String getTimeFromTimestamp(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var formatter = new DateFormat('h:mm a');
  return formatter.format(date);
}
