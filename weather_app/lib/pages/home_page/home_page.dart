import 'package:flutter/material.dart';
import 'package:text_app_todo/bloc/weather_bloc/weather_bloc.dart';
import 'package:text_app_todo/pages/home_page/widgets/enter_city.dart';
import 'package:text_app_todo/pages/home_page/widgets/theme_switcher.dart';
import 'package:text_app_todo/pages/home_page/widgets/weather_info.dart';
import 'package:text_app_todo/services/weather_repository.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weatherRepository: weatherRepository),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Weather Today"),
        ),
        body: Center(
            child: Column(
          children: const [
            Icon(
              WeatherIcons.cloudy,
              color: Colors.blue,
              size: 50,
            ),
            EnterCity(),
            WeatherInfoContainer(),
          ],
        )),
        floatingActionButton: ThemeSwitcher(),
      ),
    );
  }
}



// BlocProvider(
//       create: (context) => WeatherBloc(weatherRepository: weatherRepository),
//       child:



