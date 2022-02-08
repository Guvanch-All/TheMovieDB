import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_movie_db/core/app/navigation/main_navigation.dart';
import 'package:the_movie_db/core/utils/theme.dart';
import 'package:the_movie_db/main.dart';


class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // static const mainNavigation = MainNavigation();//static для того чтобы он пересоздовался при
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movie DB',
      theme: lightTheme == true ? basicTheme() : basicDarkTheme(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ru', ''), // Russian, no country code
      ],
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.loaderWidget,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
