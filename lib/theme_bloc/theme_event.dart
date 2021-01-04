
abstract class ThemeEvent {}

class InitialTheme extends ThemeEvent {}

class LightTheme extends ThemeEvent {
  @override
  String toString() => 'LightTheme';
}

class DarkTheme extends ThemeEvent {
  @override
  String toString() => 'Dark Theme';
}