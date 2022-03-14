import 'Clouds.dart';
import 'Main.dart';
import 'NewReponse.dart';
import 'Rain.dart';
import 'Sys.dart';
import 'Weather.dart';
import 'Wind.dart';

class InfomationWeather {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  String? dtTxt;
  Rain? rain;

  InfomationWeather(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
        this.rain});

  InfomationWeather.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'].toDouble();
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
  }

}