import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_app_todo/bloc/theme_switcher_bloc/theme_switcher_event.dart';

import '../../../bloc/theme_switcher_bloc/theme_switcher_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final DarkThemeBloc _darkThemerBloc = BlocProvider.of<DarkThemeBloc>(context);
    return FloatingActionButton(
      onPressed: () {

        // можно реализовать и без параметра в SwitchThemeEvent 
        //_darkThemerBloc.isDark = false; протестить!
        _darkThemerBloc.add(SwitchThemeEvent(!_darkThemerBloc.isDark));
      },
      child: Icon(Icons.sunny),
      backgroundColor: Colors.grey,
    );
  }
}
