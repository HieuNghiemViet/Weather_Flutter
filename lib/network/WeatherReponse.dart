import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/NewReponse.dart';

// class WeatherApiService {
//   final String _url =
//       "https://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=28d3ee0a2527556a4f8779146404f1ac";
//
//   late Dio _dio;
//
//   WeatherApiService() {
//     _dio = Dio();
//   }
//
//   Future<NewResponse?> fetchNewWeather() async {
//     try {
//       print('HieuNV: Fetch new');
//       Response response = await _dio.get(_url);
//       NewResponse newResponse = NewResponse.fromJson(response.data);
//       print('HieuNV: '+ newResponse.name.toString());
//       return newResponse;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
