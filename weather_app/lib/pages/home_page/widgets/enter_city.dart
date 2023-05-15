import 'package:flutter/material.dart'; //
import 'package:text_app_todo/bloc/weather_bloc/weather_bloc.dart'; //
import 'package:text_app_todo/bloc/weather_bloc/weather_event.dart'; //
import 'package:text_app_todo/services/weather_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; //

class EnterCity extends StatelessWidget {
  
  const EnterCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (city) {
          // параметр - city
          _weatherBloc.add(FetchWeatherEvent(city));
        },
        decoration: const InputDecoration(
          labelText: 'Введите город',
          prefixIcon: Icon(Icons.text_fields),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
