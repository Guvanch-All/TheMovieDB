import 'package:flutter/material.dart';
import 'input_theme.dart';
import 'style_constants.dart';

ThemeData basicTheme() => ThemeData(
    brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: ltAppBarColor
  ),
    textTheme:  TextTheme(
        headline6: TextStyle(
      fontFamily: defaultFont,
      color: ltPrimaryWhiteColor,
    ),

    bodyText1: TextStyle(
      fontFamily: defaultFont,
      color: ltPrimaryTextColor,
      fontSize: defaultTextSize,
      height: 1.5
    ),
      bodyText2: TextStyle(
          fontFamily: defaultFont,
          color: ltPrimaryTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          height: 1.5
      ),
      caption: TextStyle(
        fontSize: 17,
        color: ltPrimaryRedColor,
        fontFamily: defaultFont,
      )

    ),

    buttonTheme: ButtonThemeData(
    height: 50,
    buttonColor: ltPrimaryAccentBlueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
  ),


inputDecorationTheme: MyInputTheme().theme(),


);

ThemeData basicDarkTheme() => ThemeData(
  brightness: Brightness.dark,

);

