class Rain {
  double? d3h;

  Rain({this.d3h});

  Rain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'];
  }

}