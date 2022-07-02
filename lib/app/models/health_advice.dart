class HealthAdviceModel {
  String? title;
  String? url;

  // make getter to handle null values from API
  // or call them directly in the variable
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
