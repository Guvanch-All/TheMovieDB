import 'package:flutter/material.dart';
abstract class textFont {
  static const customTextStyle = TextStyle(
    fontSize: 15,
    height: 1.2,
    // letterSpacing: 2,
    fontFamily: 'Comfortaa',
    color: Colors.black,
  );
}

abstract class buttonStyle {
  static final ButtonStyle defaultStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(1,180,228,1)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
        side: const BorderSide(width: 3, color: Colors.white70),
      ),
    ),
  );
}
