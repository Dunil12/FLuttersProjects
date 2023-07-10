import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_info_model.dart';

class WeatherProvider {
  // затем добавть параметр сити
  Future<WeatherInfoModel> getWeather(String city) async {
    const apiKey = '214c079f7af546cf9c8135142230705';

    final url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final dynamic weatherJson = json.decode(response.body);
      return WeatherInfoModel.fromJson(weatherJson);
    } else if (response.statusCode == 400) {
      throw Exception('Error Internet Connection');
    } else {
      throw Exception('Error to find this City');
    }
  }
}
