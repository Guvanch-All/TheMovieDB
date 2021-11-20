import 'package:flutter/material.dart';
import 'package:the_movie_db/UI/navigation/main_navigation.dart';
import 'package:the_movie_db/utils/theme.dart';

import '../../../main.dart';
import 'model/my_app_model.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key, required this.model}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // static const mainNavigation = MainNavigation();//static для того чтобы он пересоздовался при
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movie DB',
      theme: lightTheme == true ? basicTheme() : basicDarkTheme(),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
