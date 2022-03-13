import 'package:weather/model/List.dart';
import 'City.dart';

class NewResponse {
  String? cod;
  int? message;
  int? cnt;
  List<Lists>? list;
  City? city;

  NewResponse({this.cod, this.message, this.cnt, this.list, this.city});

  NewResponse.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Lists>[];
      json['list'].forEach((v) {
        list!.add(new Lists.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  bool isEmpty() {
    if (list?.isEmpty ?? true) {
      return true;
    } else {
      return false;
    }
  }
}
