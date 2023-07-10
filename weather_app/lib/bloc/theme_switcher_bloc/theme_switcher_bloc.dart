import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_app_todo/bloc/theme_switcher_bloc/theme_switcher_event.dart';
import 'package:text_app_todo/bloc/theme_switcher_bloc/theme_switcher_state.dart';

class DarkThemeBloc extends Bloc<DarkThemeEvent, ThemeSwitcherState> {
  bool isDark = false;
  DarkThemeBloc() : super(ThemeSwitcherInitialState()) {
    on<SwitchThemeEvent>((event, emit) {
      isDark = event.isDark;
      if (isDark) {
        emit(ThemeSwitcherDarkState());
      } else {
        emit(ThemeSwitcherInitialState());
      }
    });
  }
}
