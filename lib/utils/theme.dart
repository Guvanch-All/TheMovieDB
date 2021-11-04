import 'package:flutter/material.dart';
import 'style_constants.dart';

ThemeData basicTheme() => ThemeData(
    brightness: Brightness.light,

    textTheme:  TextTheme(
        headline6: TextStyle(
      fontFamily: defaultFont,
      color: primaryWhiteColor,
    ),

    bodyText1: TextStyle(
      fontFamily: defaultFont,
      color: primaryTextColor,
      fontSize: defaultTextSize,
      height: 1.5
    ),
    ),

    buttonTheme: ButtonThemeData(
    height: 50,
    buttonColor: primaryButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
  )


);


