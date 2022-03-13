import 'package:dio/dio.dart';
import 'package:weather/constant/string.dart';
import 'package:weather/model/NewReponse.dart';

class CurrentWeatherController {
  late Dio _dio;

  CurrentWeatherController() {
    _dio = Dio();
  }

  Future<NewResponse?> fetchNewWeather() async {
    try {
      print('HieuNV: Fetch new');
      Response response = await _dio.get(DefineString.URL);
      NewResponse newResponse = NewResponse.fromJson(response.data);
      print('HieuNV:  ${newResponse.list?.length}');
      return newResponse;
    } catch (e) {
      print(e);
    }
  }

}
