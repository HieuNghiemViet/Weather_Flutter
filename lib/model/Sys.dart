class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}