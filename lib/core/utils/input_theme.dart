import 'package:flutter/material.dart';
import 'package:the_movie_db/core/utils/style_constants.dart';


class MyInputTheme {
  TextStyle _buildTextStyle(Color color, {double size = 22.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: color,
          width: 2.0,
        ));
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        constraints: const BoxConstraints(maxWidth: 400),

        ///BORDER
        enabledBorder: _buildBorder(ltAppBarColor),
        border: _buildBorder(ltAppBarColor),

        errorBorder: _buildBorder(ltPrimaryRedColor),
        focusedErrorBorder: _buildBorder(ltPrimaryRedColor),

        focusedBorder: _buildBorder(ltPrimaryAccentBlueColor),
        disabledBorder: _buildBorder(ltPrimaryGreyColor),

        /// TextStyle
        suffixStyle: _buildTextStyle(ltPrimaryTextColor),
        counterStyle: _buildTextStyle(ltPrimaryGreyColor, size: 12.0),
        floatingLabelStyle: _buildTextStyle(ltPrimaryAccentBlueColor),
        labelStyle: _buildTextStyle(ltAppBarColor, size: 19.0),
      );

}

class MyInputTheme2 {
  TextStyle _buildTextStyle(Color color, {double size = 22.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: color,
          width: 2.0,
        ));
  }

  InputDecorationTheme theme() => InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    constraints: const BoxConstraints(maxWidth: 200),

    ///BORDER
    enabledBorder: _buildBorder(ltAppBarColor),
    border: _buildBorder(ltAppBarColor),

    errorBorder: _buildBorder(ltPrimaryRedColor),
    focusedErrorBorder: _buildBorder(ltPrimaryRedColor),

    focusedBorder: _buildBorder(ltPrimaryAccentBlueColor),
    disabledBorder: _buildBorder(ltPrimaryGreyColor),

    /// TextStyle
    suffixStyle: _buildTextStyle(ltPrimaryTextColor),
    counterStyle: _buildTextStyle(ltPrimaryGreyColor, size: 12.0),
    floatingLabelStyle: _buildTextStyle(ltPrimaryAccentBlueColor),
    labelStyle: _buildTextStyle(ltAppBarColor, size: 19.0),
  );


}