import 'package:text_app_todo/model/weather_info_model.dart';
import 'package:text_app_todo/pages/home_page/widgets/weather_info.dart';

abstract class WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherInfoModel loadedWeatherInfoModel;
  WeatherLoadedState({required this.loadedWeatherInfoModel});
}

class WeatherEntaringState extends WeatherState {}

class WeatherErrorState extends WeatherState {}
