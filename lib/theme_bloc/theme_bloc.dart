import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/utils/shared_pref_helper.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    on<SetIntitialThemeEvent>((event, emit) async {
      bool hasThemeDark = await SharedPrefHelper().isDark();
      emit(hasThemeDark ? ThemeData.dark() : ThemeData.light());
    });
    on<ToggleThemeEvent>((event, emit) async {
      bool hasDarkTheme = state == ThemeData.dark();
      emit(hasDarkTheme ? ThemeData.light() : ThemeData.dark());
      SharedPrefHelper().setTheme(!hasDarkTheme);
    });
  }
}
