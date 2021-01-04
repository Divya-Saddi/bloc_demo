import 'package:bloc/bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:bloc_example/theme_bloc/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc(ThemeState initialState) : super(initialState);

  @override
  ThemeState get initialState => ThemeState.lightTheme();

  void onLightThemeChange() => add(LightTheme());
  void onDarkThemeChange() => add(DarkTheme());
  void onDecideThemeChange() => add(InitialTheme());


  @override
  Stream<ThemeState> mapEventToState(event) async* {

    if (event is InitialTheme) {
      print('inside Theme decision body');
      final int optionValue = await _getTheme();
      if (optionValue == 0) {
        yield ThemeState.lightTheme();
      } else if (optionValue == 1) {
        yield ThemeState.darkTheme();
      }
    }


    if (event is DarkTheme) {
      yield ThemeState.darkTheme();
      try {
        _saveTheme(1);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }

    if (event is LightTheme) {
      yield ThemeState.lightTheme();
      try {
        _saveTheme(0);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }
  }

  Future<void> _saveTheme(int optionValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme_option', optionValue);
  }

  Future<int> _getTheme() async {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    print(brightness);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('system_theme_option',  (brightness == Brightness.dark)?1:0);
    if(preferences.get("theme_option") == null) preferences.setInt('theme_option',  (brightness == Brightness.dark)?1:0);
    int option = preferences.get('theme_option') ?? 0;
    return option;
  }

}

final ThemeBloc changeThemeBloc = ThemeBloc(ThemeState.lightTheme())..onDecideThemeChange();

