import 'package:flutter/material.dart';
import 'package:the_movie_db/UI/auth/auth_widget.dart';
import 'package:the_movie_db/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // theme: ThemeData(
      //   brightness: Brightness.dark
      // ),
        theme: basicTheme(),
      home: const AuthWidget()
    );
  }
}
