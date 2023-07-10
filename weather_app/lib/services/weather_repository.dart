import 'package:text_app_todo/services/weather_api_provider.dart';
import '../model/weather_info_model.dart';

class WeatherRepository{
  final WeatherProvider _weatherProvider = WeatherProvider(); 
  Future<WeatherInfoModel> getWeatherRepository(String city) => _weatherProvider.getWeather(city); 
}