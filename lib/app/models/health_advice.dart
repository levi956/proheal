class HealthAdviceModel {
  String? title;
  String? url;

  String get titleH => title ?? '';
  String get urlH => url ?? '';

  HealthAdviceModel({this.title, this.url});

  factory HealthAdviceModel.fromJson(Map<String, dynamic> json) {
    return HealthAdviceModel(
      title: json['Title'],
      url: json['Url'],
    );
  }
}
