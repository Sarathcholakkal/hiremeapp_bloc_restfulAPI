part of 'theme_bloc.dart';

sealed class ThemeEvent {}

class SetIntitialThemeEvent extends ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}
