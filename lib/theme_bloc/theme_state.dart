import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState({@required this.themeData});

  factory ThemeState.lightTheme() {
    return ThemeState(themeData:  _buildLightTheme());
  }

  factory ThemeState.darkTheme() {
    return ThemeState(themeData: _buildDarkTheme());
  }
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: CustomColors.red,
    backgroundColor: CustomColors.lightThemeAppBg,
    primaryColor: CustomColors.lightThemeSubTittle2,
    primaryColorLight: CustomColors.lightThemeGrey,
    primaryColorDark: CustomColors.white,
    dialogBackgroundColor: CustomColors.backgroundLight,
    errorColor: CustomColors.red,
    dividerColor: Colors.transparent,
    primaryTextTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.black
          )
      ),
    appBarTheme: AppBarTheme(
        color: CustomColors.white,
        iconTheme: IconThemeData(color: CustomColors.black),
        textTheme:TextTheme(

            caption: TextStyle(
                color: CustomColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400))),
    // default font family.
    buttonTheme: ButtonThemeData(
      minWidth: 50,
      buttonColor:CustomColors.red,     //  <-- dark color
      textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
    )
  );
}

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: CustomColors.darkThemeAppBg,
    accentColor: CustomColors.red,
    primaryColor: CustomColors.darkThemeSubTittle2,
    primaryColorLight: CustomColors.white,
    primaryColorDark: CustomColors.darkThemeSubTittle2,
    bottomAppBarColor: CustomColors.lightGray,
    dialogBackgroundColor: CustomColors.backgroundLight,
    errorColor: CustomColors.red,
    dividerColor: Colors.transparent,
    primaryTextTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.white
        )
    ),

    appBarTheme: AppBarTheme(
        color: CustomColors.red,
        iconTheme: IconThemeData(color: CustomColors.black),
        textTheme:TextTheme(
            caption: TextStyle(
                color: CustomColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400))),

    buttonTheme: ButtonThemeData(
      minWidth: 50,
      buttonColor:CustomColors.red,     //  <-- dark color
      textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
    )
  );


}

class CustomColors {
  static const red = Color(0xFFD13F33);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF1D1D1D);
  static const darkThemeAppBg = Color(0xFF1D1D1D);
  static const lightThemeAppBg = Color(0xFFFFFFFF);
  static const lightThemeGrey = Color(0xFF949AB2);
  static const lightThemeSubTittle2 = Color(0xFFD7DCE6);
  static const darkThemeSubTittle2 = Color(0xFF383F4B);
  static const price = Color(0xFFFFB401);
  static const darkThemeloginContainerbg = Color(0xFF949AB2);
  static const grey = Color(0xFF949AB2);
  static const grey1  = Color.fromRGBO(148, 154, 178, 1);
  static const lightGray = Color(0xFFF6F6F6);
  static const darkGray = Color(0xFF979797);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
}

class CustomSizes {
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
  static const double bottomBarColor = 12;
  static const double bodyText1Size = 16;
  static const double bodyText2Size = 14;
  static const double subTittleText1Size = 19;
  static const double subHeaderText1Size = 18;
  static const double buttonSize = 18;
  static const double inputTextSize = 20;
  static const double headingSize = 24;
  static const double TittleSize = 35;
  static const double buttonRectangleRadius = 8;
}
