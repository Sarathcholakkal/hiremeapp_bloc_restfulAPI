import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    on<SetIntitialThemeEvent>((event, emit) async {
      bool hasThemeDark = await isDark();
      emit(hasThemeDark ? ThemeData.dark() : ThemeData.light());
    });
    on<ToggleThemeEvent>((event, emit) async {
      bool hasDarkTheme = state == ThemeData.dark();
      emit(hasDarkTheme ? ThemeData.light() : ThemeData.dark());
      setTheme(!hasDarkTheme);
    });
  }
}

Future<bool> isDark() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();

  return pref.getBool('is_dart') ?? false;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setBool('is_dark', isDark);
}
