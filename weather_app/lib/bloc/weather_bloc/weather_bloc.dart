import 'package:bloc/bloc.dart';
import 'package:text_app_todo/bloc/weather_bloc/weather_event.dart';
import 'package:text_app_todo/bloc/weather_bloc/weather_state.dart';
import 'package:text_app_todo/model/weather_info_model.dart';
import 'package:text_app_todo/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  // изначально такое состояние super(WeatherEmptyState())
  WeatherBloc({required this.weatherRepository}) : super(WeatherEmptyState()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());

      if (event.city != ""){
      try {
        final WeatherInfoModel weatherInfoModel =
            await weatherRepository.getWeatherRepository(event.city);
        emit(WeatherLoadedState(loadedWeatherInfoModel: weatherInfoModel));
      } 
      // обработаем ошибки
      catch (error) {
        if (error == "Error Internet Connection") {
          emit(WeatherErrorState());
        }
        else if (error == "Error to find this City") {
          emit(WeatherEntaringState());
        }
      }}
      else{
        emit(WeatherEmptyState());
      }
    });
    on<ClearWeatherEvent>((event, emit) async {
      emit(WeatherEmptyState());
    });
  }
}
