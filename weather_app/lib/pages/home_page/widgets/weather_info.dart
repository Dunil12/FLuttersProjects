import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_app_todo/bloc/weather_bloc/weather_bloc.dart';
import 'package:text_app_todo/bloc/weather_bloc/weather_state.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherInfoContainer extends StatelessWidget {
  const WeatherInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherEmptyState) {
        return Center(
            child: FractionallySizedBox(
                widthFactor:
                    0.8, // Установите желаемое процентное соотношение ширины контейнера
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Введите название города, чтобы увидеть погоду',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                )));
      }

      if (state is WeatherLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }


      if (state is WeatherLoadedState) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.loadedWeatherInfoModel.country,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Text(state.loadedWeatherInfoModel.city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const Icon(
                WeatherIcons.cloudy,
                color: Colors.white,
                size: 48,
              ),
              const SizedBox(height: 8),
              Text(
                "${state.loadedWeatherInfoModel.temperature}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                state.loadedWeatherInfoModel.condition,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      }

      // здесь должно быть такого города нет
      if (state is WeatherEntaringState) {
        return Center(
            child: FractionallySizedBox(
                widthFactor:
                    0.8, // Установите желаемое процентное соотношение ширины контейнера
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Такого города не существует',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                )));
      }

      if (state is WeatherErrorState) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.red,
          child: const Text(
            'Произошла ошибка. Пожалуйста, проверьте интернет соединение',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
