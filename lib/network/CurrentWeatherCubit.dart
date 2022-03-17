import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant/string.dart';
import 'package:weather/model/NewReponse.dart';

class CurrentWeatherCubit extends Cubit<NewResponse> {
  late Dio _dio;

  CurrentWeatherCubit() : super(NewResponse()) {
    _dio = Dio();
  }

  Future fetchNewWeather() async {
    try {
      print('HieuNV: Fetch new');
      Response response = await _dio.get(DefineString.URL);
      NewResponse newResponse = NewResponse.fromJson(response.data);
      emit(newResponse);
    } catch (e) {
      print(e);
    }
  }
}
