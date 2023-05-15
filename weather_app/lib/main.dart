import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_app_todo/bloc/theme_switcher_bloc/theme_switcher_bloc.dart';
import 'package:text_app_todo/pages/home_page/home_page.dart';

import 'bloc/theme_switcher_bloc/theme_switcher_state.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DarkThemeBloc>(
      create: (context) => DarkThemeBloc(),
      child: BlocBuilder<DarkThemeBloc, ThemeSwitcherState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Theme Switcher',
            theme: (state is ThemeSwitcherInitialState) ? ThemeData.light() : ThemeData.dark(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
    

      



// BlocProvider<DarkThemeBloc>(
//           create: (context) => DarkThemeBloc(),
//         ),