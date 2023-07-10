class WeatherInfoModel {
  double temperature;
  String country;
  String city;
  String condition;

  WeatherInfoModel({
    required this.temperature,
    required this.country,
    required this.city,
    required this.condition,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      temperature: json['current']['temp_c'],
      country: json['location']['country'],
      city: json['location']['name'],
      condition: json['current']['condition']['text'],
    );
  }
}
